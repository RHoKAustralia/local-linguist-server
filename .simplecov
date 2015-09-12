SimpleCov.at_exit do
  SimpleCov.result.format!
  `open #{Dir.pwd}/coverage/index.html`
end

if %w{yes true on}.include? ENV['COVERAGE']
  puts 'Running RSpec with coverage'

  SimpleCov.start do
    add_filter 'spec'
  end
end