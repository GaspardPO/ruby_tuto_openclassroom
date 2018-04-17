require 'test/unit'
require_relative '../src/ennemi'

class EnnemiTest < Test::Unit::TestCase

  def test_degats_entre_2_et_10
    # arbitrairement choisis. parce que pourquoi pas.

    ennemi = Ennemi.new "ennemi"

    degats_array = (0..100).map{ennemi.degats}

    assert_equal degats_array.min, 2
    assert_equal degats_array.max, 10
    # il y a probablement mieux pour tester du random
  end
end