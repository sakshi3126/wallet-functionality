class WalletTransaction < ApplicationRecord
  belongs_to :user_wallet
  belongs_to :user
  scope :monthly_total, ->(date_time = Time.now) { where('transaction_date BETWEEN ? AND ?', date_time.at_beginning_of_month, date_time.end_of_month).sum(:credit_amt) }


  def total_credit
    start_at = Date.new(2019, 01, 01).beginning_of_day
    end_at = Date.new(2019, 12, 31).end_of_day
    # filter_by_dates = start_at.beginning_of_month..end_at.end_of_month
    WalletTransaction.all.sum(:credit_amt)
    credit_amount = []
    credit_amount << WalletTransaction.where(transaction_date: start_at..end_at).sum(&:credit_amt)
  end

  def month_wise_credit
    month_wise_credit = WalletTransaction.where(user_wallet_id: 1).group_by(&:transaction_date)
    data = []
    month_wise_credit.each do |key, value|
      puts value
      data_obj = {}
      data_obj[:id] = key
      data_obj[:amount] = value.sum(&:credit_amt)
      data << data_obj
    end
  end

  def month_wise_debit
    month_wise_credit = WalletTransaction.where(user_wallet_id: 1).group_by(&:transaction_date)
    data = []
    month_wise_credit.each do |key, value|
      puts value
      data_obj = {}
      data_obj[:id] = key
      data_obj[:amount] = value.sum(&:debit_amt)
      data << data_obj
    end
  end


end
