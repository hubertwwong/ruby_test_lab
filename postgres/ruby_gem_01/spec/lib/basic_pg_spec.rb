describe "basic_pg_spec" do
  it "connect" do
    DB = Sequel.connect(adapter: 'postgres', host: 'localhost',
                        database: 'blog', user: 'user', password: 'password')
    expect(DB).to eq "a"
  end
end
