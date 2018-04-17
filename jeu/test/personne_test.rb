require 'test/unit'
require_relative '../src/personne'

class PersonneTest < Test::Unit::TestCase

  def test_personne_vivante
    #Renvoie le nom et les points de vie si la personne est en vie
    plop = Personne.new "plop"
    assert_equal plop.info, "plop (100/100 pv)"

    plop_blesse = Personne.new "plop blessé"
    plop_blesse.points_de_vie = 50
    assert_equal plop_blesse.info, "plop blessé (50/100 pv)"
  end

  def test_personne_morte
    # - Renvoie le nom et "vaincu" si la personne a été vaincue
    plop_mort = Personne.new "plop mort"
    plop_mort.en_vie = false
    assert_equal plop_mort.info, "plop mort (vaincu)"
  end

  def test_subit_attaque
    plop = Personne.new "plop"
    assert_equal plop.points_de_vie, 100

    plop.subit_attaque 30

    assert_equal plop.points_de_vie, 70
    # todo
    # test pour # Affiche ce qu'il s'est passé
  end

  def test_subit_attaque_et_meurt
    plop = Personne.new "plop"
    assert_true plop.en_vie

    plop.subit_attaque 110

    assert_false plop.en_vie
  end

  def test_attaque
    attaquant = Personne.new "attaquant"
    defenseur = Personne.new "defenseur "

    assert_equal defenseur.points_de_vie, 100

    attaquant.attaque defenseur

    assert_equal defenseur.points_de_vie, 99
  end

end