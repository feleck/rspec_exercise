class AtmMachine
  attr_reader :balance, :transaction_limit
  def initialize(balance = 0)
    @balance = balance
    @transaction_limit = 500
  end
end
