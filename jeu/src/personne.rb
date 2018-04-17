class Personne
  attr_accessor :nom, :points_de_vie, :en_vie

  def initialize(nom)
    @nom = nom
    @points_de_vie = 100
    @en_vie = true
  end

  def info
    if en_vie
      "#{nom} (#{points_de_vie}/100 pv)"
    else
      "#{nom} (vaincu)"
    end
  end

  def subit_attaque(degats_recus)
    @points_de_vie -= degats_recus
    puts "#{nom} subit #{degats_recus}hp de dégats!"

    if @points_de_vie < 0
      @en_vie = false
      puts "#{nom} a été vaincu"
    end
  end

  def attaque(personne)
    puts "#{nom} attaque #{personne.nom}"
    personne.subit_attaque degats
  end

  def degats
    1 # todo : dégats de base à définir.
  end
end