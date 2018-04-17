require_relative 'personne'

class Joueur < Personne
  attr_accessor :degats_bonus

  def initialize(nom)
    # Par défaut le joueur n'a pas de dégats bonus
    initialize_bonus

    # Appelle le "initialize" de la classe mère (Personne)
    super(nom)
  end

  def degats
    degats = Random.rand(15..30) + @degats_bonus
    initialize_bonus
    degats
  end

  def soin
    @points_de_vie += 40
    @points_de_vie = 100 if @points_de_vie > 100
    puts "#{nom} regagne de la vie."
  end

  def ameliorer_degats
    puts "#{nom} améliore son attaque."
    @degats_bonus += 20
  end

  private
  def initialize_bonus
    @degats_bonus = 0
  end
end