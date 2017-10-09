require('minitest/rg')
require('minitest/autorun')

require_relative("../bar.rb")
require_relative("../guest.rb")

class TestBar < Minitest::Test

  def setup
    @guest_1 = Guest.new('broke', 1, @song_1)
    @guest_2 = Guest.new('wealthy', 40, @song_2)
    @tab_1 = BarTab.new('broke', 2)
    @tab_2 = BarTab.new('wealthy', 2)
  end

  def test_bar_knows_guest
    assert_equal('broke', @tab_1.guest)
  end

  def test_bar_knows_amount
    assert_equal(2, @tab_1.amount)
  end

  def test_get_wallet
    assert_equal(1, @guest_1.wallet)
  end

  ## not going about this the right way
  ## if both the guest and the bill
  ## have a name, then why do I need to point
  ## one to the other?

  def test_guest_can_pay__enough_money
    assert_equal(true, @guest_2.check_if_guest_has_enough_money(@tab_2))
  end

  def test_guest_can_pay__not_enough_money
    assert_equal(false, @guest_1.check_if_guest_has_enough_money(@tab_2))
  end

  def test_get_drink__enough_money
    assert_equal(true, @tab_2.pay(guest_2))
  end

  def test_get_drink__not_enough_money
    assert_equal("Bartender: no drinks for you.", @tab_1.pay)
  end

end
