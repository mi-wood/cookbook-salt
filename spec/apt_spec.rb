require "chefspec"

describe "salt::apt" do
  before do
    @chef_run = ::ChefSpec::ChefRunner.new(:step_into => ["apt_repository"])
    @chef_run.converge "salt::apt"
  end

  it "adds apt PPA" do
    file = "/etc/apt/sources.list.d/salt.list"
    content = @chef_run.file(file).content

    #TODO(retr0h): determine why content can be nil.
    content && (content.should match %r{deb\s+http://ppa.launchpad.net/saltstack/salt/ubuntu precise main})
    content && (content.should match %r{deb-src\s+http://ppa.launchpad.net/saltstack/salt/ubuntu precise main})
  end

  it "adds GPG key" do
    keyserver = "keyserver.ubuntu.com"
    key = "0E27C0A6"
    @chef_run.should execute_command "apt-key adv --keyserver #{keyserver} --recv #{key}"
  end
end
