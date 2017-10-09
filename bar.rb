class BarTab

  attr_reader(:guest, :amount)

  def initialize (guest, amount)
    @guest = guest
    @amount = amount
  end

  def check_if_guest_has_enough_money(tab)
    if guest.wallet > tab.amount
      return true
    else
      return false
    end
  end

  def pay(guest, tab)
    if check_if_guest_has_enough_money == true
      guest.wallet -= tab.amount
    else
      return "Bartender: no drinks for you."
    end
  end

end
