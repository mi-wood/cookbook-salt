require_relative File.expand_path('../../spec_helper.rb', __FILE__)

describe 'salt::cron' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['salt']['cron']['gem_version'] = '2.0.20'
      node.set['salt']['cron']['path'] = '/etc/salt/cron'
      node.set['salt']['master']['user'] = 'root'
      node.set['salt']['cron']['region'] = 'us-east-1'
      node.set['salt']['master']['log_file'] = '/var/log/salt/master'
    end.converge(described_recipe)
  end

  it 'installs aws-sdk-core gem' do
    expect(chef_run).to install_gem_package('aws-sdk-core').with('version' => '2.0.20')
  end

  it 'creates directory /etc/salt/cron' do
    expect(chef_run).to create_directory('/etc/salt/cron').with(
      'owner' => 'root',
      'group' => 'root',
      'mode' => '644',
    )
  end

  it 'creates cookbook file /etc/salt/cron/cleanup_salt_key.py' do
    expect(chef_run).to create_cookbook_file('/etc/salt/cron/cleanup_salt_keys.py').with(
      'owner' => 'root',
      'group' => 'root',
      'mode' => '744',
    )
  end

  it 'creates cronjob cleanup_salt_keys' do
    expect(chef_run).to create_cron_d('cleanup_salt_keys').with(
      'command' =>
      '/usr/bin/python /etc/salt/cron/cleanup_salt_keys.py '\
      '--region=us-east-1 2>&1 | sudo tee -a /var/log/salt/master > /dev/null',
      'user' => 'root',
      'hour' => '*'
    )
  end
end
