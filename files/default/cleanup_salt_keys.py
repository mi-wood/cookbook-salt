#!/usr/bin/python

import argparse
import boto.ec2
import boto.utils
import itertools
import logging
import sys

# Set up logging
FORMAT = "%(asctime)-15s %(levelname)s %(message)s"
logging.basicConfig(level=logging.INFO, format=FORMAT)

# Salt steals logging, so import after config
import salt.config
import salt.wheel

parser = argparse.ArgumentParser(
    prog='cleanup_salt_keys',
    description='Delete salt keys for terminated instances'
    )
parser.add_argument(
    '--region',
    default='us-east-1',
    help='AWS EC2 region to query'
    )
parser.add_argument(
    '--force',
    default=False,
    choices=['False', 'True'],
    help='Forces salt to delete keys'
    )
ARGS = parser.parse_args()

logging.info("Starting key check")

# Get all minion names
opts = salt.config.master_config('/etc/salt/master')
wheel = salt.wheel.Wheel(opts)
keys = wheel.call_func('key.list_all')['minions']

# Get ec2 name tags
try:
    ec2 = boto.ec2.connect_to_region(region_name=ARGS.region)
    my_instance_id = boto.utils.get_instance_metadata()["instance-id"]
    filter_list = {'vpc-id': ec2.get_only_instances([my_instance_id])[0].vpc_id}  # get vpc filter
    chain = itertools.chain.from_iterable
    all_instances = chain([res.instances for res in ec2.get_all_instances(filters=filter_list)])
except Exception as e:
    logging.error(e)

names = map(lambda instance: instance.tags.get('Name'), all_instances)

# make a list of keys to revoke
# anything that is not listed in ec2 by name tag
keys_to_revoke = filter(lambda key: key not in names, keys)

# Check number of keys being revoked
# If less than 20% of total keys, delete them
if len(keys_to_revoke) == 0:
    logging.info("No keys to delete")
elif len(keys_to_revoke) > len(keys)*.2 and ARGS.force is False:
    logging.error("%d keys to revoke with only %d keys total" % (len(keys_to_revoke), len(keys)))
    logging.error("Will not revoke keys, exiting")
    sys.exit(1)
else:
    logging.info("Deleting:\n%s" % ',\n'.join(keys_to_revoke))
    map(lambda key: wheel.call_func(fun='key.delete', match=key), keys_to_revoke)
