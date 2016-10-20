require 'rails_helper'

RSpec.describe "ailments/new", type: :view do
  before(:each) do
    assign(:ailment, Ailment.new())
  end

  it "renders new ailment form" do
    render

    assert_select "form[action=?][method=?]", ailments_path, "post" do
    end
  end
end
