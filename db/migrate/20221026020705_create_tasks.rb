class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :content
      t.date :deadline, null: false
      t.string :status
      t.string :priority

      t.timestamps
    end
  end
end
