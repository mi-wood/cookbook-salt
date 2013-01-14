require "chefspec"

describe "salt::default" do
  it "installs minion" do
    ::Chef::Recipe.any_instance.should_receive(:include_recipe).with "salt::minion"
    chef_run = ::ChefSpec::ChefRunner.new.converge "salt::default"
  end
end
