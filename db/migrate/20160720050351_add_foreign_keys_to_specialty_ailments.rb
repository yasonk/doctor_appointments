class AddForeignKeysToSpecialtyAilments < ActiveRecord::Migration
  def change
    add_foreign_key :specialty_ailments, :specialty_id
    add_foreign_key :specialty_ailments, :ailment_id
  end
end
