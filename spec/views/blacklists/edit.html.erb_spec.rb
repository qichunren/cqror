require 'spec_helper'

describe "blacklists/edit.html.erb" do
  before(:each) do
    @blacklist = assign(:blacklist, stub_model(Blacklist,
      :new_record? => false,
      :ip => "MyString",
      :remark => "MyString"
    ))
  end

  it "renders the edit blacklist form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => blacklist_path(@blacklist), :method => "post" do
      assert_select "input#blacklist_ip", :name => "blacklist[ip]"
      assert_select "input#blacklist_remark", :name => "blacklist[remark]"
    end
  end
end
