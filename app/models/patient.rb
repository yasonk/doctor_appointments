class Patient < ActiveRecord::Base
  include PersonConcern

  belongs_to :ailment
  has_many :appointments, dependent: :destroy
end
