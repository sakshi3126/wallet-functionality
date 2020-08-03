# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'active_support/time'
users = User.first
user_wallets = UserWallet.first

datetime = Date.new(2020, 1, 1)
dates = (1..12).map { |i| (datetime - i.month).end_of_month }

  dates.each do |date|
    WalletTransaction.create(transaction_type: 'credit', credit_amt: rand(100..1000), transaction_date: date, user_id: 1, user_wallet_id: 1)
  end


  dates.each do |date|
    WalletTransaction.create(transaction_type: 'debit', debit_amt: rand(100..1000), transaction_date: date, user_id: 1, user_wallet_id: 1)
  end
