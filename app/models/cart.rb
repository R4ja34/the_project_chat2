class Cart < ApplicationRecord
  belongs_to :user  # Appartient à un utilisateur
  has_many :items  # Un panier a plusieurs articles
end