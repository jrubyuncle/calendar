class AddDeletedAtToCalender < ActiveRecord::Migration
  def change
    add_column :calenders, :deleted_at, :datetime
  end
end
