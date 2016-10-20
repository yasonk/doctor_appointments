require 'rails_helper'

RSpec.describe "ailments/index", type: :view do
  before(:each) do
    assign(:ailments, [
      create(:ailment),
      create(:ailment)
    ])
  end

  it "renders a list of ailments" do
    render
  end
end
