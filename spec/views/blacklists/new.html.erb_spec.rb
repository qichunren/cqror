require 'spec_helper'

describe "blacklists/new.html.erb" do
  before(:each) do
    assign(:blacklist, stub_model(Blacklist,
      :ip => "MyString",
      :remark => "MyString"
    ).as_new_record)
  end

  it "renders new blacklist form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => blacklists_path, :method => "post" do
      assert_select "input#blacklist_ip", :name => "blacklist[ip]"
      assert_select "input#blacklist_remark", :name => "blacklist[remark]"
    end
  end
end
