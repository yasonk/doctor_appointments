require 'rails_helper'

RSpec.describe "appointments/index", type: :view do
  before(:each) do
    assign(:appointments, [
      create(:appointment),
      create(:appointment)
    ])
  end

  it "renders a list of appointments" do
    render
  end
end
