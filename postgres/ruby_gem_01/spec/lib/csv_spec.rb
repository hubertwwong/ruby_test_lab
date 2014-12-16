require "pry"
require "csv"

# going to try to do a csv load and insert.
require_relative "../support/db"

describe "csv_spec" do
  let(:db) {
    d = DB.new
    d.connect

    # csv insert table
    d.client.drop_table? :csv_insert
    d.client.create_table(:csv_insert) do
      primary_key :id
      DateTime :date
      Float :open
      Float :high
      Float :low
      Float :close
      Integer :volume
      Float :adj_close
    end

    return d
  }

  it "csv insert" do
    @csv_insert = db.client[:csv_insert] # Create a dataset

    # read the csv.
    # using headers true changes the data struct
    #csv_file = CSV.read("spec/fixtures/GS.csv", headers:true)
    quotes = []
    first_row = true
    CSV.foreach("spec/fixtures/GS.csv") do |row|
      if first_row
        first_row=false
        next
      end
      puts row.inspect
      quotes << row
    end

    # Populate the table
    col_list = [:date, :open, :high, :low, :close, :volume, :adj_close]
    #raw_input = [["12/16/2014", 1.2, 1.3, 1.4, 1.5, 10000, 1.6]]
    @csv_insert.import(col_list, quotes)

    # insert
    expect(@csv_insert.count).to be > 10
    expect(@csv_insert.count).to be < 20
  end
end
