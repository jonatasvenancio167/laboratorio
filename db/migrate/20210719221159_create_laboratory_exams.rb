class CreateLaboratoryExams < ActiveRecord::Migration[6.1]
  def change
    create_table :laboratory_exams do |t|
      t.references :laboratory, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true

      t.timestamps
    end
  end
end
