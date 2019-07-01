require 'spec_helper'
require 'savon'

describe DmUniboUserSearch do

  before(:all) do
    @dsa = DmUniboUserSearch::Client.new
  end

  it "should find pietro.donatini@unibo.it in @unibo.it" do
    res = @dsa.find_user("pietro.donatini@unibo.it", -> (a){ a.upn =~ /@unibo.it/ })
    expect(res.users.first.id_anagrafica_unica).to eq(436108)
  end

  it "should not find pietro.donatini with name == PIPPO" do
    res = @dsa.find_user("pietro.donatini", -> (a){ a.name == "PIPPO" })
    expect(res.users).to eq([])
  end

  it "should find pietro.donatini with name == Pietro" do
    res = @dsa.find_user("pietro.donatini", -> (a){ a.name == "Pietro" })
    expect(res.users.first.id_anagrafica_unica).to eq(436108)
  end

  it "should find pietro.donatini in @studio.unibo.it" do
    res = @dsa.find_user("pietro.donatini", -> (a){ a.upn =~ /@studio.unibo.it/ })
    expect(res.users).to eq([])
  end

end

