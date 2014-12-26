require "pry"

require_relative "../support/db"

describe "clone_spec" do
  let(:db) {
    d = DB.new
    d.connect

    # dropping
    d.client.drop_table? :clone_01_new
    d.client.drop_table? :clone_01

    # recreate table
    d.client.create_table(:clone_01) do
      primary_key :id
      String :name
    end

    return d
  }

  it "clone 1" do
    @clone_01 = db.client[:clone_01] # Create a dataset
    # insert 1 row. want to make sure that clone does not copy the row.
    @clone_01.insert(name: "aaa")
    @clone_01.insert(name: "bbb")

    # clone the table
    result = db.client.run("CREATE TABLE clone_01_new AS SELECT * FROM clone_01 WHERE id=-1")
    # drops the id column...
    db.client.alter_table(:clone_01_new) do
      drop_column :id
    end
    # insert off the new table.
    @clone_01_new = db.client[:clone_01_new]
    @clone_01_new.insert(name: "ccc")

    # clone should only have 1 item. ccc
    expect(@clone_01_new.count).to eq 1
  end


  it "true" do
    expect(true).to be false
  end
end
