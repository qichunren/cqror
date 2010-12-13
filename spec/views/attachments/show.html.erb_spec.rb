require 'spec_helper'

describe "attachments/show.html.erb" do
  before(:each) do
    @attachment = assign(:attachment, stub_model(Attachment,
      :name => "Name",
      :description => "Description",
      :avatar_file_name => "Avatar File Name",
      :avatar_content_type => "Avatar Content Type",
      :avatar_file_size => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Avatar File Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Avatar Content Type/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
