class AddTagToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :tag, :string
  end
end
