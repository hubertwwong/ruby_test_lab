# spec/spec_helper.rb
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'pry'

# non of this works...
# boo...

# require the support directory.
#Dir[File.join(File.dirname(__FILE__), "support" , "**.rb")].each do |f|
#  require_relative f
#end

#Dir["./spec/support/**/*.rb"].sort.each { |f| require f}
#Dir["./spec/support/**/*.rb"].each { |f| require f}
#Dir["spec/support/*.rb"].each {|f| require f}

# require all stuff in the lib directory.
# so you don't have to require in each location.
#Dir[File.join(File.dirname(__FILE__), "lib" , "**.rb")].each do |f|
#  require f
#end

# specify rspec order.
RSpec.configure do |config|
  config.order = 'random'
end
