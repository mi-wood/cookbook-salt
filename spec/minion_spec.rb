require "chefspec"
require "chefspec/matchers/shared" # #render
require "yaml"

def load_yaml_for file, node
  ::YAML.load render(file, node)
end

describe "salt::minion" do
  before { @chef_run = ::ChefSpec::ChefRunner.new.converge "salt::minion" }

  it "configures apt" do
    ::Chef::Recipe.any_instance.should_receive(:include_recipe).with "salt::apt"
    chef_run = ::ChefSpec::ChefRunner.new.converge "salt::minion"
  end

  it "installs package" do
    @chef_run.should install_package "salt-minion"
  end

  it "starts service" do
    @chef_run.should start_service "salt-minion"
  end

  it "enables service" do
    @chef_run.should set_service_to_start_on_boot "salt-minion"
  end

  describe "minion conf" do
    before do
      @file = "/etc/salt/minion"
      @yaml = load_yaml_for @chef_run.template(@file), @chef_run.node
    end

    it "has proper owner" do
      @chef_run.template(@file).should be_owned_by("root", "root")
    end

    it "has proper modes" do
      m = @chef_run.template(@file).mode

      sprintf("%o", m).should == "644"
    end

    it "has custom banner" do
      @chef_run.should create_file_with_content @file, <<-EOF
# This file autogenerated by Chef 
# Do not edit, changes will be overwritten.
      EOF
    end

    it "has master" do
      @yaml['master'].should == "salt"
    end

    it "has master port" do
      @yaml['master_port'].should == 4506
    end

    it "has user" do
      @yaml['user'].should == "root"
    end

    it "has root dir" do
      @yaml['root_dir'].should == "/"
    end

    it "has pki dir" do
      @yaml['pki_dir'].should == "/etc/salt/pki"
    end

    it "has id" do
      chef_run = ::ChefSpec::ChefRunner.new do |n|
        n.set['salt'] = {}
        n.set['salt']['minion'] = {}
        n.set['salt']['minion']['id'] = "foo-id"
      end.converge "salt::minion"
      yaml = load_yaml_for chef_run.template(@file), chef_run.node

      yaml['id'].should == "foo-id"
    end

    it "doesn't have id" do
      @yaml['id'].should be_nil
    end

    it "has append domain" do
      chef_run = ::ChefSpec::ChefRunner.new do |n|
        n.set['salt'] = {}
        n.set['salt']['minion'] = {}
        n.set['salt']['minion']['append_domain'] = "foo-domain"
      end.converge "salt::minion"
      yaml = load_yaml_for chef_run.template(@file), chef_run.node

      yaml['append_domain'].should == "foo-domain"
    end

    it "doesn't have append domain" do
      @yaml['append_domain'].should be_nil
    end

    it "has sub timeout" do
      @yaml['sub_timeout'].should == 60
    end

    it "has cachedir" do
      @yaml['cachedir'].should == "/var/cache/salt"
    end

    it "has cache jobs" do
      @yaml['cache_jobs'].should be_false
    end

    it "has acceptance wait time" do
      @yaml['acceptance_wait_time'].should == 10
    end

    it "has dns check" do
      @yaml['dns_check'].should be
    end

    it "has disable modules" do
      chef_run = ::ChefSpec::ChefRunner.new do |n|
        n.set['salt'] = {}
        n.set['salt']['minion'] = {}
        n.set['salt']['minion']['disable_modules'] =  "[cmd,test]"
      end.converge "salt::minion"
      yaml = load_yaml_for chef_run.template(@file), chef_run.node

      yaml['disable_modules'].should == ["cmd", "test"]
    end

    it "doesn't have disable modules" do
      @yaml['disable_modules'].should be_nil
    end

    it "has disable returners" do
      chef_run = ::ChefSpec::ChefRunner.new do |n|
        n.set['salt'] = {}
        n.set['salt']['minion'] = {}
        n.set['salt']['minion']['disable_returners'] =  "[]"
      end.converge "salt::minion"
      yaml = load_yaml_for chef_run.template(@file), chef_run.node

      yaml['disable_returners'].should be_empty
    end

    it "doesn't have disable returners" do
      @yaml['disable_returners'].should be_nil
    end

    it "has module dirs" do
      @yaml['module_dirs'].should be_empty
    end

    it "has returner dirs" do
      @yaml['returner_dirs'].should be_empty
    end

    it "has states dirs" do
      @yaml['states_dirs'].should be_empty
    end

    it "has render dirs" do
      @yaml['render_dirs'].should be_empty
    end

    it "has providers" do
      chef_run = ::ChefSpec::ChefRunner.new do |n|
        n.set['salt'] = {}
        n.set['salt']['minion'] = {}
        n.set['salt']['minion']['providers'] = {
          "foo" => "bar",
          "baz" => "qux"
        }
      end.converge "salt::minion"
      yaml = load_yaml_for chef_run.template(@file), chef_run.node

      yaml['providers'].should == { "foo" => "bar", "baz" => "qux" }
    end

    it "doesn't have providers" do
      @yaml['providers'].should be_nil
    end

    it "has cython enable" do
      @yaml['cython_enable'].should be_false
    end

    it "has renderer" do
      @yaml['renderer'].should == "yaml_jinja"
    end

    it "has state verbose" do
      @yaml['state_verbose'].should be_false
    end

    it "has autoload dynamic modules" do
      @yaml['autoload_dynamic_modules'].should be_true
    end

    it "has clean dynamic modules" do
      @yaml['clean_dynamic_modules'].should be_true
    end

    it "has environment" do
      @yaml['environment'].should == "None"
    end

    it "has state top" do
      @yaml['state_top'].should == "top.sls"
    end

    it "has file roots" do
      chef_run = ::ChefSpec::ChefRunner.new do |n|
        n.set['salt'] = {}
        n.set['salt']['minion'] = {}
        n.set['salt']['minion']['file_roots'] = {
          "base" => [
            "/foo",
            "/bar"
          ]
        }
      end.converge "salt::minion"
      yaml = load_yaml_for chef_run.template(@file), chef_run.node

      yaml['file_roots'].should == { "base" => ["/foo", "/bar"] }
    end

    it "doesn't have file roots" do
      @yaml['file_roots'].should be_nil
    end

    it "has hash type" do
      @yaml['hash_type'].should == "md5"
    end

    it "has pillar roots" do
      chef_run = ::ChefSpec::ChefRunner.new do |n|
        n.set['salt'] = {}
        n.set['salt']['minion'] = {}
        n.set['salt']['minion']['pillar_roots'] = {
          "base" => [
            "/foo"
          ]
        }
      end.converge "salt::minion"
      yaml = load_yaml_for chef_run.template(@file), chef_run.node

      yaml['pillar_roots'].should == { "base" => ["/foo"] }
    end

    it "doesn't have pillar roots" do
      @yaml['pillar_roots'].should be_nil
    end

    it "has open mode" do
      @yaml['open_mode'].should be_false
    end

    it "has multiprocessing" do
      @yaml['multiprocessing'].should be
    end

    it "has log file" do
      @yaml['log_file'].should == "/var/log/salt/minion"
    end

    it "has log level" do
      @yaml['log_level'].should == "warning"
    end

    it "has log granular levels" do
      chef_run = ::ChefSpec::ChefRunner.new do |n|
        n.set['salt'] = {}
        n.set['salt']['minion'] = {}
        n.set['salt']['minion']['log_granular_levels'] =  '{ "salt": "warning", "salt.modules": "debug"}'
      end.converge "salt::minion"
      yaml = load_yaml_for chef_run.template(@file), chef_run.node

      yaml['log_granular_levels'].should == { "salt" => "warning", "salt.modules" => "debug" }
    end

    it "doesn't have log granular levels" do
      @yaml['log_granular_levels'].should be_nil
    end

    it "restarts conserver-server" do
      resource = ["salt-minion", "service", "delayed"]

      @chef_run.template(@file).notifies(*resource).should be_true
    end
  end
end
