class Item < ApplicationRecord
  belongs_to :cart, optional: true  # Appartient à un panier (optionnel)
  belongs_to :order, optional: true  # Appartient à une commande (optionnel)
end
