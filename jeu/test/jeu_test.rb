require 'test/unit'
require_relative '../src/jeu'
require_relative '../src/personne'
require_relative '../src/monde'

class JeuTest < Test::Unit::TestCase

  def test_est_fini_quand_joueur_mort
    joueur = Personne.new "joueur"
    joueur.en_vie = false

    monde = Monde.new
    monde.ennemis = [Personne.new("Ennemi")]

    assert_true Jeu.est_fini(joueur, monde)
  end

  def test_est_fini_quand_ennemis_morts
    joueur = Personne.new "joueur"

    monde = Monde.new
    ennemi = Personne.new("Ennemi")
    ennemi.en_vie = false
    monde.ennemis = [ennemi]

    assert_true Jeu.est_fini(joueur, monde)
  end

  def test_n_est_pas_fini_quand_joueur_et_ennemi_vivants
    joueur = Personne.new "joueur"
    monde = Monde.new
    monde.ennemis = [Personne.new("Ennemi")]

    assert_false Jeu.est_fini(joueur, monde)
  end
end