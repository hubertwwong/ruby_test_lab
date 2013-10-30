# include a module.
include Foo

# inheritance test using a module
# see the spec test results.
class Honda < Foo::Car
  
  # overriding the name method
  def self.name
    return "Honda"
  end
  
end