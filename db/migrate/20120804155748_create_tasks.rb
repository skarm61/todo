class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.integer :user_id
      t.boolean :is_done

      t.timestamps
    end
  end
end
