require 'rails_helper'

RSpec.describe Ailment do
  subject { create :ailment }

  it { is_expected.to be_valid }
end
