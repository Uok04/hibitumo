class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :user, nill: false, foreign_key: true
      t.string :task_name, nill: false
      t.text :description, nill: false
      t.integer :category_id, nill: false
      t.date :deadline, nill: false
      t.timestamps
    end
  end
end
