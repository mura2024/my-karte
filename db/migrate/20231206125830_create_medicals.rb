class CreateMedicals < ActiveRecord::Migration[7.0]
  def change
    create_table :medicals do |t|
      t.string :subject, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
