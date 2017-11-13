class AtmMachine
  attr_reader :balance, :transaction_limit
  class AccountEmptyError < StandardError
  end
  class NoSufficientFoundsError < StandardError
  end
  def initialize(balance = 0)
    @balance = balance
    @transaction_limit = 500
  end

  def withdraw(amount, pin)
    raise AccountEmptyError unless @balance > 0
    raise NoSufficientFoundsError if amount > @balance
    @balance -= amount
  end
end
