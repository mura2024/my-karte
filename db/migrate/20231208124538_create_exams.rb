class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string     :title,     null: false
      t.string     :hospital,  null: false
      t.date       :exam_date, null: false
      t.text       :comment
      t.references :user,      null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
