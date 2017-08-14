class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.date :date
      t.string :status, default: "pending"
      t.references :user, foreign_key: true
      t.references :teacher_subject, foreign_key: true

      t.timestamps
    end
  end
end
