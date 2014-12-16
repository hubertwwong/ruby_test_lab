require "pry"

require_relative "../support/db"

describe "update_set_spec" do
  let(:db) {
    d = DB.new
    d.connect

    # insert select main table
    d.client.drop_table? :update_set
    d.client.create_table(:update_set) do
      primary_key :id
      String :name
      Float :price
    end

    # insert select src table
    d.client.drop_table? :update_set_src
    d.client.create_table(:update_set_src) do
      primary_key :id
      String :name
      Float :price
    end

    return d
  }
  before {
    @update_set = db.client[:update_set] # Create a dataset
    @update_set_src = db.client[:update_set_src] # Create a dataset

    # Populate the table
    @update_set.insert(name: "aaa", price: 1)
    @update_set.insert(name: "bbb", price: 2)

    # Populate the table
    @update_set_src.insert(name: "aaa", price: 3)
    @update_set_src.insert(name: "ccc", price: 4)
  }

  it "sanity" do
    expect(@update_set.count).to be == 2
    expect(@update_set_src.count).to be == 4
  end

  it "insert select" do
    @update_set_src.select([:name, :price]).where(id: 3)
    #@update_set.insert([:name, :price], @update_set_src.select(:name, :price).where(price: 3))
    @update_set.insert([:name, :price], @update_set_src.select(:name, :price))
    expect(@update_set.count).to be == 6
  end
end
