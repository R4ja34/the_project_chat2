# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Assure-toi d'inclure les dépendances nécessaires
require 'faker'

# Supprime tous les utilisateurs et articles existants
Item.destroy_all
User.destroy_all


# Crée 5 utilisateurs avec des adresses e-mail aléatoires et un mot de passe par défaut
# Création des utilisateurs
5.times do
  user = User.create(
    email: Faker::Internet.email(domain: 'yopmail.com'),
    password: "mdp1234"
  )
end

# Création de 10 articles aléatoires
items = []
10.times do
  item = Item.create(
    title: Faker::Superhero.power,
    description: Faker::Lorem.paragraphs(number: 3, supplemental: false).join(' '),
    price: Faker::Number.decimal(l_digits: 2)
  )
  items << item  # Stocke les articles créés dans un tableau
end

