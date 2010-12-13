require 'spec_helper'

describe "attachments/edit.html.erb" do
  before(:each) do
    @attachment = assign(:attachment, stub_model(Attachment,
      :new_record? => false,
      :name => "MyString",
      :description => "MyString",
      :avatar_file_name => "MyString",
      :avatar_content_type => "MyString",
      :avatar_file_size => 1
    ))
  end

  it "renders the edit attachment form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => attachment_path(@attachment), :method => "post" do
      assert_select "input#attachment_name", :name => "attachment[name]"
      assert_select "input#attachment_description", :name => "attachment[description]"
      assert_select "input#attachment_avatar_file_name", :name => "attachment[avatar_file_name]"
      assert_select "input#attachment_avatar_content_type", :name => "attachment[avatar_content_type]"
      assert_select "input#attachment_avatar_file_size", :name => "attachment[avatar_file_size]"
    end
  end
end
