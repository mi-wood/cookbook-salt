require 'foodcritic'
require 'rubocop/rake_task'

task test: [:foodcritic, :rubocop, :chefspec]

task :chefspec do
  sh 'rspec --pattern spec/unit/**/*_spec.rb --color'
end

FoodCritic::Rake::LintTask.new
RuboCop::RakeTask.new
