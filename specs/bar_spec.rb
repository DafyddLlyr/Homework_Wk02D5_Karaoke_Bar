require("minitest/autorun")
require("minitest/rg")
require_relative("../bar")
require_relative("../drink")
require_relative("../guest")
require_relative("../song")

class TestBar < MiniTest::Test

  def setup
    @drink_1 = Drink.new("Beer", 5)
    @drink_2 = Drink.new("Whisky", 10)
    @bar = Bar.new("Downstairs Bar", 100, {@drink_1=>25, @drink_2=>30})
    @song_1 = Song.new("Dancing in the Moonlight")
    @guest_1 = Guest.new("Gina", 16, @song_1, 20)
    @guest_2 = Guest.new("Tim", 25, @song_1, 100)
  end

  def test_bar_name
    assert_equal("Dafydd's Karaoke Bar", @bar.name)
  end

  def test_bar_till
    assert_equal(100, @bar.till)
  end

  def test_reduce_stock
    @bar.reduce_stock(@drink_1)
    assert_equal(24, @bar.stock[@drink_1])
  end

  def test_serve__under_18
    assert_equal(false, @bar.serve?(@guest_1))
  end

  def test_serve__under_18
    assert_equal(true, @bar.serve?(@guest_2))
  end

end
