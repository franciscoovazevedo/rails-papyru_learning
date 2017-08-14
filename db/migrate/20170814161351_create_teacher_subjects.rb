class CreateTeacherSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :teacher_subjects do |t|
      t.date :begin
      t.date :end
      t.integer :price
      t.text :description
      t.references :subject, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
