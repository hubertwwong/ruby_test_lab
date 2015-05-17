require_relative '../../../src/modules_nested/sizzle'

describe Sizzle do
  it "foo" do
    expect(Sizzle.foo1).to be == "bar_hello"
  end
    
  it "nested_foo" do
    expect(Sizzle.foo2).to be == "nested baz hello"
  end
end