class AddSpecialtyToDoctor < ActiveRecord::Migration
  def change
    add_reference :doctors, :specialty, index: true
  end
end
