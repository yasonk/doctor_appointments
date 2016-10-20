require 'rails_helper'

RSpec.describe "appointments/show", type: :view do
  let(:appointment) { create(:appointment) }

  before(:each) do
    assign(:appointment, appointment)
  end

  it "renders attributes in <p>" do
    render
  end
end
