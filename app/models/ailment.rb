class Ailment < ActiveRecord::Base
  has_many :specialty_ailment, dependent: :destroy

  validates :name, presence: true
  def to_s
    name
  end
end
