class CreateSpecialtyAilments < ActiveRecord::Migration
  def change
    create_table :specialty_ailments do |t|
      t.integer :specialty_id
      t.integer :ailment_id

      t.timestamps null: false
    end
  end
end
