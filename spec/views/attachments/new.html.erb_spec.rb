require 'spec_helper'

describe "attachments/new.html.erb" do
  before(:each) do
    assign(:attachment, stub_model(Attachment,
      :name => "MyString",
      :description => "MyString",
      :avatar_file_name => "MyString",
      :avatar_content_type => "MyString",
      :avatar_file_size => 1
    ).as_new_record)
  end

  it "renders new attachment form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => attachments_path, :method => "post" do
      assert_select "input#attachment_name", :name => "attachment[name]"
      assert_select "input#attachment_description", :name => "attachment[description]"
      assert_select "input#attachment_avatar_file_name", :name => "attachment[avatar_file_name]"
      assert_select "input#attachment_avatar_content_type", :name => "attachment[avatar_content_type]"
      assert_select "input#attachment_avatar_file_size", :name => "attachment[avatar_file_size]"
    end
  end
end
