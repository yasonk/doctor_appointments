class SpecialtyAilment < ActiveRecord::Base
  belongs_to :specialty
  belongs_to :ailment
end
