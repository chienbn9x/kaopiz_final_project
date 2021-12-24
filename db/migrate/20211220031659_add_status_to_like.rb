class AddStatusToLike < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :status, :integer, :default => 0
  end
end
