require "spec_helper"
require "savon"

describe DmUniboUserSearch do
  before(:all) do
    dsa = DmUniboUserSearch::Client.new
    @res = dsa.find_user("436108")
  end

  it "should respond ok" do
    expect(@res.ok?).to be_truthy
  end

  it "should be one Pietro Donatini" do
    expect(@res.count).to eq(1)
  end

  it "should find name pietro on first result" do
    expect(@res.users.first.name).to eq("Pietro")
  end
end
