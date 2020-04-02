require 'pry'

class Transfer

  attr_reader :sender, :receiver, :status
  attr_accessor :transfer_amount, :bank_account
  @@all = []

  def initialize (sender, receiver, transfer_amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @transfer_amount = transfer_amount
    Transfer.all << self
  end

  def amount
    @transfer_amount
  end

  def valid?
    # Transfer.all == BankAccount.all
    (Transfer.all == self) || (BankAccount.all == self)
  end

  def self.all
    @@all
  end

end

