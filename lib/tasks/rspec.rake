begin
  namespace :spec do
    desc 'Run RSpec with minimal output'
    RSpec::Core::RakeTask.new(:minimal)

    desc 'Run RSpec with detailed output'
    RSpec::Core::RakeTask.new(:detailed) do |t|
      t.rspec_opts = '--format doc --color'
    end
  end
  desc 'Alias for spec:minimal'
  task spec: 'spec:minimal'

  task default: :spec
rescue LoadError
  puts 'rspec.rake not available in production'
end
