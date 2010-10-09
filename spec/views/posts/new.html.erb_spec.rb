require 'spec_helper'

describe "posts/new.html.erb" do
  before(:each) do
    assign(:post, stub_model(Post,
      :new_record? => true,
      :title => "MyString",
      :click_count => 1,
      :content => "MyText",
      :published => false
    ))
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => posts_path, :method => "post" do
      assert_select "input#post_title", :name => "post[title]"
      assert_select "input#post_click_count", :name => "post[click_count]"
      assert_select "textarea#post_content", :name => "post[content]"
      assert_select "input#post_published", :name => "post[published]"
    end
  end
end
