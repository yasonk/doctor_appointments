class Specialty < ActiveRecord::Base
  has_many :specialty_ailments, dependent: :destroy
  has_many :ailments, through: :specialty_ailments

  validates_presence_of :name

  def to_s
    name
  end
end
