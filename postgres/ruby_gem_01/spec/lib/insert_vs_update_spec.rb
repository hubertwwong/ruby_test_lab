require "benchmark"
require "pry"
#require Date

require_relative "../support/db"

describe "insert_vs_update_spec" do
  let(:db) {
    d = DB.new
    d.connect

    # insert select main table
    d.client.drop_table? :insert_vs_update_orig
    d.client.create_table(:insert_vs_update_orig) do
      primary_key :id
      String :name
      DateTime :created_at
    end

    # insert select src table
    d.client.drop_table? :insert_vs_update_orig_src
    d.client.create_table(:insert_vs_update_orig_src) do
      primary_key :id
      String :name
      DateTime :created_at
    end

    return d
  }
  before {
    @insert_vs_update_orig = db.client[:insert_vs_update_orig] # Create a dataset
    @insert_vs_update_src = db.client[:insert_vs_update_orig_src] # Create a dataset

    num_items = 100
    num_items_half = num_items / 2

    # the original table.
    num_items.times do |i|
      @insert_vs_update_orig.insert(name: "a" + i.to_s,
                                    created_at: Date.today - i)
    end

    # some new table with data. half the same and half update cols.
    num_items_half.times do |i|
      @insert_vs_update_src.insert(name: "a" + i.to_s,
                                   created_at: Date.today - i)
    end
    num_items_half.times do |i|
      @insert_vs_update_src.insert(name: "a" + i.to_s,
                                   created_at: Date.today - (i + num_items_half))
    end
    # new data for the src
    num_items_half.times do |i|
      @insert_vs_update_src.insert(name: "a" + (i + num_items).to_s,
                                   created_at: Date.today - (i+ num_items_half + num_items))
    end
  }

  it "sanity" do
    expect(@insert_vs_update_orig.count).to be > 2
    #expect(@insert_vs_update_src.count).to be == 4
  end

  # updates if the row exist. probably double loops
  xit "update all, insert if new" do
    # cycle thru src table.
    # force update
    Benchmark.bm do |x|
      x.report("update all, insert if new") {
        @insert_vs_update_src.each do |row|
          # grab the target row by date.
          row_dest = @insert_vs_update_orig.where(created_at: row[:created_at])
          # update that row using the src. should throw an error if its does not exist.
          if 1 != row_dest.update(name: row[:name])
            # straight insert.
            @insert_vs_update_orig.insert([:name, :created_at], [row[:name], row[:created_at]])
          end
        end
      }
    end

    # just doing the count to see if the src and dest are the same.
    expect(@insert_vs_update_orig.count).to be == @insert_vs_update_src.count
  end

  xit "insert diff, update new" do
    Benchmark.bm do |x|
      x.report("insert diff, update new") {
        @insert_vs_update_src.left_outer_join(@insert_vs_update_orig, :created_at => :created_at)
        # 1. Figure out src not in the dest.
        # need a join

        # 2. insert that into the table.
        # insert select.

        # 3. update the rest.
        # update.

      }
    end

    # just doing the count to see if the src and dest are the same.
    #expect(@insert_vs_update_orig.count).to be == @insert_vs_update_src.count
    expect(@insert_vs_update_src.left_outer_join(@insert_vs_update_orig, :created_at => :created_at).count).to be == 1
  end

end
