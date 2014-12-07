require "pry"

require_relative "../support/db"

describe "raw_exec_spec" do
  let(:db) {
    d = DB.new
    d.connect

    d.client.drop_table? :raw_exec
    d.client.create_table(:raw_exec) do
      primary_key :id
      String :name
    end

    return d
  }

  it "insert 1 item" do
    expect(db.client.test_connection).to be true
    items = db.client[:raw_exec] # Create a dataset

    # Populate the table
    items.insert(name: "abc")

    # fetch item.
    result = db.client.fetch("SELECT * FROM ?", :raw_exec)

    # item is 1
    expect(result.count).to be == 1
  end

  # TODO come up with a list of queries you want to try out.
  # 1. strings. how they are handle.
  # 2. ???
end
