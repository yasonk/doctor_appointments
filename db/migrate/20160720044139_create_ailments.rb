class CreateAilments < ActiveRecord::Migration
  def change
    create_table :ailments do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
