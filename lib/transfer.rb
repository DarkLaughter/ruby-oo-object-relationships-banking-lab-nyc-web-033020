require 'pry'

class Transfer

  attr_reader :sender, :receiver
  attr_accessor :transfer_amount, :status
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
    (sender.valid?) && (receiver.valid?)
  end

  def self.all
    @@all
  end

  def execute_transaction
    if (valid? && sender.balance > amount) && @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if (valid? && sender.balance > amount) && @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end


end

