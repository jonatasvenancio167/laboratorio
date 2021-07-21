class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.string :nome
      t.string :tipo
      t.boolean :status
      t.references :laboratory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
