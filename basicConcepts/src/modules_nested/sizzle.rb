require_relative 'foo/bar'
require_relative 'foo/nested_foo/nested'

# testing out how module works...
class Sizzle
  include Foo
  #include Foo::NestedFoo

  def self.foo1
    bz = Foo::Bar.new
    return bz.bar_hello
  end
    
  def self.foo2
    return Foo::NestedFoo::Baz.nested_baz_hello
  end
end