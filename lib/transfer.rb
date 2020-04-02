class Transfer

  attr_reader :sender, :receiver, :status
  attr_accessor :transfer_amount, :bank_account

  def initialize (sender, receiver, transfer_amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @transfer_amount = transfer_amount
  end

  def amount
    @transfer_amount
  end

  def valid?
    BankAccount.all.each do |account|
      account.status == "open"
    end
  end

end
