class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :content
      t.date :deadline, null: false
      t.integer :status, null: false
      t.integer :priority, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
