require_relative 'personne'

class Ennemi < Personne
  def degats
    Random.rand 2..10
  end
end