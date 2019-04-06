require "pry"

class Transfer
 attr_accessor :sender, :receiver, :status
 attr_reader :name, :amount, :transer
 
  def initialize(sender, receiver, amount)
    
    @sender = sender
    @receiver = receiver 
    @status = "pending"
    @amount = amount 
  end 
  
  def valid?
    sender.status && receiver.status ? true : false
    sender.valid?
    receiver.valid?
   # binding.pry
  end 
  
  def execute_transaction 
    if valid? && status == "pending"
      if amount < self.sender.balance
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = "complete"
      else
         self.status = "rejected"
         "Transaction rejected. Please check your account balance."
      end
    end
  end
  
  def reverse_transfer
    if status == "complete"
      self.receiver.balance -= amount 
      self.sender.balance += amount 
      
      self.status = "reversed"
    end 
  end 
      
  
    
  

  
  
  
end
