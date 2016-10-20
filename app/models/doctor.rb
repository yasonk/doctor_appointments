class Doctor < ActiveRecord::Base
  include PersonConcern

  belongs_to :specialty
  has_many :appointments, dependent: :destroy

  validates :specialty, presence: true

  def name
    "Dr. #{super}"
  end

  def can_treat(ailment)
    return false if specialty.blank?
    specialty.ailments.include?(ailment)
  end
end
