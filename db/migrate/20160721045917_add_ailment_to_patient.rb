class AddAilmentToPatient < ActiveRecord::Migration
  def change
    add_reference :patients, :ailment, index: true
  end
end
