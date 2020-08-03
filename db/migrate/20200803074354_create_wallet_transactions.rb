class CreateWalletTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :wallet_transactions do |t|
      t.string :transaction_type
      t.integer :credit_amt
      t.integer :debit_amt
      t.date :transaction_date
      t.references :user
      t.references :user_wallet

      t.timestamps
    end
  end
end
