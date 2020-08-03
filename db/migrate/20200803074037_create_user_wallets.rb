class CreateUserWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :user_wallets do |t|
      t.integer :total_amount
      t.references :user

      t.timestamps
    end
  end
end
