require 'spec_helper'

describe "blacklists/index.html.erb" do
  before(:each) do
    assign(:blacklists, [
      stub_model(Blacklist,
        :ip => "Ip",
        :remark => "Remark"
      ),
      stub_model(Blacklist,
        :ip => "Ip",
        :remark => "Remark"
      )
    ])
  end

  it "renders a list of blacklists" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ip".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Remark".to_s, :count => 2
  end
end
