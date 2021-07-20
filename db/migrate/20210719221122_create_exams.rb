class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.string :name
      t.string :type
      t.boolean :status

      t.timestamps
    end
  end
end
