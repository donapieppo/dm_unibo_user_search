require 'spec_helper'
require 'savon'

describe DmUniboUserSearch do

  before(:all) do
    @dsa = DmUniboUserSearch::Client.new
  end

  it "should find pietro.donatini@unibo.it" do
    res = @dsa.find_user("pietro.donatini@unibo.it")
    expect(res.users.first.id_anagrafica_unica).to eq(436108)
  end

  it "should find pietro.donatini" do
    res = @dsa.find_user("pietro.donatini")
    expect(res.users.first.id_anagrafica_unica).to eq(436108)
  end

end

