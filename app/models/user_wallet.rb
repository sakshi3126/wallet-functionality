class UserWallet < ApplicationRecord
  has_many :wallet_transactions
  belongs_to :user

  def balnance
    self.total_amount + self.wallet_transactions.sum(:credit_amt) - self.wallet_transactions.sum(:debit_amt)
  end
end
