# spec/spec_helper.rb
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'

# require all stuff in the lib directory.
# so you don't have to require in each location.
Dir[File.join(File.dirname(__FILE__), "lib" , "**.rb")].each do |f|
  require f
end

# specify rspec order.
RSpec.configure do |config|
  config.order = 'random'
end
