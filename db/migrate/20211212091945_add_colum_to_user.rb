class AddColumToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :dob, :datetime
    add_column :users, :gender, :boolean
  end
end
