def required_class(file)
  File.basename(file, '.rb').split('_').map(&:capitalize).join
end

def file_list(app_path)
  Rake::FileList.new("app/#{app_path}/*.rb") { |fl| fl.exclude('~*') }
end

def class_list(app_path)
  classes = []
  file_list(app_path).each { |file| classes << required_class(file) }
  classes
end

namespace :metrics do
  desc 'Run all the metrics'
  task :all do
    Rake::Task['metrics:mutate'].invoke
    Rake::Task['metrics:flay:all'].invoke
    Rake::Task['metrics:flog:all'].invoke
    Rake::Task['metrics:rubocop'].invoke
    Rake::Task['metrics:brakeman'].invoke
  end

  desc 'Run the RSpec tests, mutating the parameters'
  task :mutate, [:path] do |t, args|
    puts args
    system("mutant -r ./config/environment.rb --use rspec #{class_list(args[0]).join(' ')}")
  end

  namespace :flay do
    desc 'Run Flay, checking for code duplication'
    task :code do
      puts 'Checking for code duplication'
      puts `flay app/**/*.rb`
    end

    desc 'Run Flay, checking for code duplication in tests'
    task :tests do
      puts 'Checking for code duplication (in tests)'
      puts `flay spec/**/*.rb`
    end

    desc 'Run Flay on everything'
    task :all do
      Rake::Task['metrics:flay:code'].invoke
      Rake::Task['metrics:flay:tests'].invoke
    end
  end

  namespace :flog do
    desc 'Run Flog, checking ABC complexity'
    task :code do
      puts 'Checking ABC complexity'
      puts `flog lib/**/*.rb`
    end

    desc 'Run Flog, checking ABC complexity on tests'
    task :tests do
      puts 'Checking ABC complexity (on tests)'
      puts `flog spec/**/*.rb`
    end

    desc 'Run Flog on everything'
    task :all do
      Rake::Task['metrics:flog:code'].invoke
      Rake::Task['metrics:flog:tests'].invoke
    end
  end

  desc 'Run RuboCop, checking code style'
  task :rubocop do
    puts `rubocop`
  end

  desc 'Run Brakeman, checking application security'
  task :brakeman do
    puts `brakeman`
  end
end
