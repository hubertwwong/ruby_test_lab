require "logger"
require "sequel"

# dirty class to stash a sequel object.
class DB
  attr_accessor :client

  #def initalize
  #  @client = self.connect
  #end

  def connect
    @client = Sequel.connect(adapter: 'postgres', host: 'localhost',
                             database: 'test_ruby_gem_01',
                             user: 'postgres', password: 'password')
    # debug flag
    @client.sql_log_level = :debug
    @client.loggers << Logger.new("main.log")
  end

  #def create_table(table_name)
  #  db.client.create_table(:artists) do
  #    primary_key :id
  #    String :name
  #  end
  #end

  #def drop_table(table_name)
  #  @client.drop_table? :table_name
  #end

end
