require "chefspec"

describe "salt::master" do
  before { @chef_run = ::ChefSpec::ChefRunner.new.converge "salt::master" }

  it "configures apt" do
    ::Chef::Recipe.any_instance.should_receive(:include_recipe).with "salt::apt"
    chef_run = ::ChefSpec::ChefRunner.new.converge "salt::master"
  end

  it "installs package" do
    @chef_run.should install_package "salt-master"
  end

  it "starts service" do
    @chef_run.should start_service "salt-master"
  end

  it "enables service" do
    @chef_run.should set_service_to_start_on_boot "salt-master"
  end
end
