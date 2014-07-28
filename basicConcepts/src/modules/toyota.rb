class Toyota

  # include a module.
  # note that the module name should be the directory name.
  include Fluffy

  # this is how you call something from a module
  def self.hello
    return Fluffy::Car.hello
  end

  # calling a different module
  def self.speed
    return Fluffy::Bike.speed
  end
end
