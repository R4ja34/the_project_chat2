class Order < ApplicationRecord
  belongs_to :user  # Appartient à un utilisateur
  belongs_to :cart, optional: true
  has_many :items  # Une commande a plusieurs articles
end
