class Toyota
  
  # include a module.
  include Foo

  # this is how you call something from a module
  def self.hello
    Foo::Car.hello
  end
  
  # calling a different module
  def self.speed
    Foo::Bike.speed
  end
  
end