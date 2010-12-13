require 'spec_helper'

describe "attachments/index.html.erb" do
  before(:each) do
    assign(:attachments, [
      stub_model(Attachment,
        :name => "Name",
        :description => "Description",
        :avatar_file_name => "Avatar File Name",
        :avatar_content_type => "Avatar Content Type",
        :avatar_file_size => 1
      ),
      stub_model(Attachment,
        :name => "Name",
        :description => "Description",
        :avatar_file_name => "Avatar File Name",
        :avatar_content_type => "Avatar Content Type",
        :avatar_file_size => 1
      )
    ])
  end

  it "renders a list of attachments" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Avatar File Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Avatar Content Type".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
