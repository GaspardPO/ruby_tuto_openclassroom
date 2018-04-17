require 'test/unit'
require_relative '../src/joueur'

class JoueurTest < Test::Unit::TestCase
  MIN_DEGATS = 15
  AMELIORATION = 20
  MAX_BASE_DEGATS = 30

  def test_degats_entre_15_et_30
    # arbitrairement choisis. parce que pourquoi pas.
    joueur = Joueur.new "bob"

    degats_array = (0..100).map {joueur.degats}

    assert_equal degats_array.min, MIN_DEGATS
    assert_equal degats_array.max, MAX_BASE_DEGATS
    # il y a probablement mieux pour tester du random mais dans le doute la boucle de 100 fait le taf.
  end

  def test_degats_bonus_de_20
    # arbitrairement fixé à +20.
    joueur = Joueur.new "bob"

    100.times {test_une_amelioration(joueur)}
  end

  def test_degats_bonus_ameliorable_plusieurs_fois
    joueur = Joueur.new "bob"

    test_deux_amelioration(joueur)
  end

  def test_degats_bonus_pour_une_seule_attaque
    joueur = Joueur.new "bob"

    joueur.ameliorer_degats

    joueur.degats

    # les autres attaques ne sont pas impactés
    degats_array = (0..100).map {joueur.degats}
    assert_equal degats_array.min, MIN_DEGATS
    assert_equal degats_array.max, MAX_BASE_DEGATS
  end

  def test_soin_redonne_40_hp
    # arbitrairement fixé à +40.
    joueur = Joueur.new "bob"
    joueur.points_de_vie = 50

    joueur.soin

    assert_equal joueur.points_de_vie, 90
  end

  def test_soin_limite_au_max
    joueur = Joueur.new "bob"

    joueur.soin

    assert_equal joueur.points_de_vie, 100
  end

  private
  def test_une_amelioration(joueur)
    joueur.ameliorer_degats
    assert_true joueur.degats >= MIN_DEGATS + AMELIORATION
  end

  def test_deux_amelioration(joueur)
    joueur.ameliorer_degats
    joueur.ameliorer_degats

    degats_ameliore = joueur.degats
    assert_true degats_ameliore >= (MIN_DEGATS + AMELIORATION + AMELIORATION)
  end
end