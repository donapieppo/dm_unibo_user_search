require "spec_helper"
require "savon"

describe DmUniboUserSearch do
  before(:all) do
    @dsa = DmUniboUserSearch::Client.new
  end

  it "should list operations" do
    expect(@dsa.operations).to eq([:get_user_parm, :get_parm_info, :find_user])
  end
end
