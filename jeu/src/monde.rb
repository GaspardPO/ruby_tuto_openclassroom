class Monde
  attr_accessor :ennemis

  def ennemis_en_vie
    @ennemis.select {|ennemi| ennemi.en_vie}
  end
end