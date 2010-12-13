require 'spec_helper'

describe "blacklists/show.html.erb" do
  before(:each) do
    @blacklist = assign(:blacklist, stub_model(Blacklist,
      :ip => "Ip",
      :remark => "Remark"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Ip/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Remark/)
  end
end
