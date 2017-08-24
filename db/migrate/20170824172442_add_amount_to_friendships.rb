class AddAmountToFriendships < ActiveRecord::Migration[5.1]
  def change
    add_column :friendships, :amount, :integer
  end
end
