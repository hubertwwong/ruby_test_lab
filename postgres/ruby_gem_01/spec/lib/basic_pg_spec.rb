require 'pry'

require_relative '../support/db'

describe "basic_pg_spec" do
  let(:db) {
    d = DB.new
    d.connect

    d.client.drop_table? :items
    d.client.create_table(:items) do
      primary_key :id
      String :name
      Float :price
    end

    return d
  }

  it "basic insert" do
    expect(db.client.test_connection).to be true
    items = db.client[:items] # Create a dataset

    # Populate the table
    items.insert(name: 'abc', price: rand * 100)
    items.insert(name: 'def', price: rand * 100)
    items.insert(name: 'ghi', price: rand * 100)

    # Print out the number of records
    #puts "Item count: #{items.count}"
    # Print out the average price
    #puts "The average price is: #{items.avg(:price)}"
    expect(items.count).to be == 3
  end
end
