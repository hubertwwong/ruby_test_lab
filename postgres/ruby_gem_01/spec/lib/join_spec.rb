require "pry"

require_relative "../support/db"

describe "join_spec" do
  let(:db) {
    d = DB.new
    d.connect

    # insert select main table
    d.client.drop_table? :join_left
    d.client.create_table(:join_left) do
      primary_key :id
      String :name
      DateTime :created_at
    end

    # insert select src table
    d.client.drop_table? :join_right
    d.client.create_table(:join_right) do
      primary_key :id
      String :name
      DateTime :created_at
    end

    return d
  }
  before {
    @join_left = db.client[:join_left] # Create a dataset
    @join_right = db.client[:join_right] # Create a dataset

    # Populate left table
    @join_left.insert(name: "aaa", created_at: "12/24/2014")
    @join_left.insert(name: "bbb", created_at: "12/25/2014")
    @join_left.insert(name: "ccc", created_at: "12/26/2014")

    # Populate right table
    @join_right.insert(name: "ddd", created_at: "12/24/2014")
    @join_right.insert(name: "eee", created_at: "12/27/2014")
  }

  xit "sanity" do
    expect(@join_left.count).to be == 3
    expect(@join_right.count).to be == 2
  end

  xit "inner join" do
    #@join_left.join(@join_right, :created_at => :created_at).each do |row|
    #  puts row
    #end
    result = @join_left.join(@join_right, :created_at => :created_at)
    expect(result.count).to be == 1
  end

  it "left join" do
    result = @join_left.left_join(@join_right, :created_at => :created_at).sql
    puts "left outer join" + result.to_s
    expect(result.count).to be == 3
  end

  it "left outer join. raw" do
    #join_query = "SELECT l.created_at, l.name, r.created_at, r.name FROM join_left l LEFT JOIN join_right r ON (l.created_at = r.created_at)"
    join_query = "SELECT r.created_at, r.name FROM join_left l LEFT JOIN join_right r ON (l.created_at = r.created_at)"
    #join_query = "SELECT l.created_at, l.name FROM join_left l LEFT JOIN join_right r ON (l.created_at = r.created_at)"
    db.client[join_query].each do |row|
      puts row
      #binding.pry
    end
  end

  xit "left outer join. where." do
    @join_left.left_outer_join(@join_right, :created_at => :created_at).each do |row|
      puts row
    end

    #result = @join_left.left_outer_join(@join_right, :created_at => :created_at)#.where(Sequel.qualify(:join_left, :name) => nil)
    #expect(result.count).to be == 3
  end
end
