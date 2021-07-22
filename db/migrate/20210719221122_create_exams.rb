class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.string :nome
      t.string :tipo
      t.boolean :status

      t.timestamps
    end
  end
end
