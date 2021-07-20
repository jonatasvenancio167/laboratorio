class CreateLaboratories < ActiveRecord::Migration[6.1]
  def change
    create_table :laboratories do |t|
      t.string :name
      t.string :address
      t.boolean :status

      t.timestamps
    end
  end
end
