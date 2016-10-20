require 'rails_helper'

RSpec.describe "ailments/edit", type: :view do
  before(:each) do
    @ailment = assign(:ailment, create(:ailment))
  end

  it "renders the edit ailment form" do
    render

    assert_select "form[action=?][method=?]", ailment_path(@ailment), "post" do
    end
  end
end
