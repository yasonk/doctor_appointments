require 'rails_helper'

RSpec.describe "ailments/show", type: :view do
  before(:each) do
    @ailment = assign(:ailment, create(:ailment))
  end

  it "renders attributes in <p>" do
    render
  end
end
