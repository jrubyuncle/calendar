class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, index: true, foreign_key: true
      t.references :calender, index: true, foreign_key: true
      t.string :title, null: false
      t.boolean :all_day, null: false, default: true
      t.datetime :start
      t.datetime :end

      t.timestamps null: false
    end
    add_index :events, :start
    add_index :events, :end
  end
end
