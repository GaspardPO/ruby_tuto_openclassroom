require 'test/unit'
require_relative '../src/monde'
require_relative '../src/personne'

class MondeTest < Test::Unit::TestCase

  def test_ennemis_en_vie
    monde = Monde.new

    vivant1 = Personne.new "vivant1"
    vivant2 = Personne.new "vivant2"
    mort1 = Personne.new "mort1"
    mort1.en_vie = false
    mort2 = Personne.new "mort2"
    mort2.en_vie = false

    monde.ennemis = [vivant1, mort1, vivant2, mort2]

    ennemis_en_vie = monde.ennemis_en_vie
    assert_equal ennemis_en_vie.length, 2
    assert_equal ennemis_en_vie, [vivant1, vivant2]
  end
end