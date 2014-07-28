# include a module.
include Fluffy

# inheritance test using a module
# see the spec test results.
class Honda < Fluffy::Car
  
  # overriding the name method
  def self.name
    return "Honda"
  end
  
end