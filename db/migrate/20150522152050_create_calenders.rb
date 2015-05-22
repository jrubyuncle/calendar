class CreateCalenders < ActiveRecord::Migration
  def change
    create_table :calenders do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.boolean :public, null: false, default: false

      t.timestamps null: false
    end
  end
end
