require "pry"

require_relative "../support/db"

describe "insert_select_spec" do
  let(:db) {
    d = DB.new
    d.connect

    # insert select main table
    d.client.drop_table? :insert_select
    d.client.create_table(:insert_select) do
      primary_key :id
      String :name
      Float :price
    end

    # insert select src table
    d.client.drop_table? :insert_select_src
    d.client.create_table(:insert_select_src) do
      primary_key :id
      String :name
      Float :price
    end

    return d
  }
  before {
    @insert_select = db.client[:insert_select] # Create a dataset
    @insert_select_src = db.client[:insert_select_src] # Create a dataset

    # Populate the table
    @insert_select.insert(name: "aaa", price: 1)
    @insert_select.insert(name: "bbb", price: 2)

    # Populate the table
    @insert_select_src.insert(name: "ccc", price: 3)
    @insert_select_src.insert(name: "ddd", price: 4)
    @insert_select_src.insert(name: "eee", price: 5)
    @insert_select_src.insert(name: "fff", price: 6)
  }

  it "sanity" do
    expect(@insert_select.count).to be == 2
    expect(@insert_select_src.count).to be == 4
  end

  it "insert select" do
    @insert_select_src.select([:name, :price]).where(id: 3)
    #@insert_select.insert([:name, :price], @insert_select_src.select(:name, :price).where(price: 3))
    @insert_select.insert([:name, :price], @insert_select_src.select(:name, :price))
    expect(@insert_select.count).to be == 6
  end
end
