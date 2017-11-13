class AtmMachine
  attr_reader :balance, :transaction_limit
  class AccountEmptyError < StandardError
  end
  class NoSufficientFoundsError < StandardError
  end
  class InaccessiblePinError < StandardError
  end
  class WrongPinError < StandardError
  end

  def initialize(balance = 0)
    @balance = balance
    @transaction_limit = 500
    @pin = 1234
    @authorized_user = false
  end

  def withdraw(amount, pin)
    raise AccountEmptyError unless @balance > 0
    raise NoSufficientFoundsError if amount > @balance
    raise WrongPinError unless @authorized_user = @pin == pin
    @balance -= amount if @authorized_user
  end

  def deposit(amount, pin)
    raise WrongPinError unless @authorized_user = @pin == pin
    @balance += amount if @authorized_user
  end

  def pin
    raise InaccessiblePinError
  end

  def authorized_user
    @authorized_user
  end
end
