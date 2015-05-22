require_relative './spec_helper'

describe file('/etc/cron.d/cleanup_salt_keys') do
  it { should be_file }
  it { should contain "#{$node['salt']['cron']['minute']} \\* \\* \\* \\*" }
end
