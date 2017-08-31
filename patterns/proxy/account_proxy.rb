class AccountProxy
  def initialize(real_account, owner)
    @subject = real_account
    @owner = owner
  end

  def deposit(amount)
    check_access
    @subject.deposit(amount)
  end


  def withdraw(amount)
    check_access
    @subject.withdraw(amount)
  end

  def balance
    check_access
    @subject.balance
  end

  def check_access
    true
  end
end
