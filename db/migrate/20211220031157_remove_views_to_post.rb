class RemoveViewsToPost < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :views
  end
end
