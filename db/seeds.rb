require 'byebug'
require 'rest-client'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# response = RestClient.get "grant_type=client_credentials&client_id=#{ENV[PETFINDER_KEY]}&client_secret=#{ENV['PETFINDER_SECRET']}" https://api.petfinder.com/v2/oauth2/token 
Pet.destroy_all

response = RestClient.get 'https://api.petfinder.com/v2/animals?limit=100', {:Authorization => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6ImRjMzVmNjkwNzI0NTg4NGExZjdmMDUxZDY4MmQwMjIwOGY1MmEyZTRmNDlkYThjN2U2NWNkZTgxNzFiYzVjZTM5NDE0ZGFiYTZlNjM4MGZiIiwiaWF0IjoxNTg4ODc5OTE4LCJuYmYiOjE1ODg4Nzk5MTgsImV4cCI6MTU4ODg4MzUxOCwic3ViIjoiIiwic2NvcGVzIjpbXX0.nnu5L3Ekfvx04E8eirxr2x9q03JQF-wW0pnmRmtMO-6phLeyz3Y3jvzHlmfKxE2Tp7Mwx6oRYCP0bRKyD46MLHQbBg3ShbBEsNhRDms0PgBQ3_ZA82onwvijWHK32jAmCPBcBMOM4bW9oxY8JzZA-pfUQTPEqZeEM2f51evPd0L9RlngBeErvFRZ9JQYO_7VBxce2pfhmYfXtdP94NMz2olgDtJaDUbNOWbffGlBRqWL76dG_irjEMUt1A__FNzbbYWbLN73DY6HbBGYA-lANv7eRFAZQSElYTWTYrbCZbY-4Bj93n2Et7qqBN0J3sH8vD6aHbc3NHEUthXpMYJSUg'}

data = JSON.parse(response)
animals_list = data["animals"]

adoptedResponse = RestClient.get 'https://api.petfinder.com/v2/animals?limit=100&page=5', {:Authorization => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6ImRjMzVmNjkwNzI0NTg4NGExZjdmMDUxZDY4MmQwMjIwOGY1MmEyZTRmNDlkYThjN2U2NWNkZTgxNzFiYzVjZTM5NDE0ZGFiYTZlNjM4MGZiIiwiaWF0IjoxNTg4ODc5OTE4LCJuYmYiOjE1ODg4Nzk5MTgsImV4cCI6MTU4ODg4MzUxOCwic3ViIjoiIiwic2NvcGVzIjpbXX0.nnu5L3Ekfvx04E8eirxr2x9q03JQF-wW0pnmRmtMO-6phLeyz3Y3jvzHlmfKxE2Tp7Mwx6oRYCP0bRKyD46MLHQbBg3ShbBEsNhRDms0PgBQ3_ZA82onwvijWHK32jAmCPBcBMOM4bW9oxY8JzZA-pfUQTPEqZeEM2f51evPd0L9RlngBeErvFRZ9JQYO_7VBxce2pfhmYfXtdP94NMz2olgDtJaDUbNOWbffGlBRqWL76dG_irjEMUt1A__FNzbbYWbLN73DY6HbBGYA-lANv7eRFAZQSElYTWTYrbCZbY-4Bj93n2Et7qqBN0J3sH8vD6aHbc3NHEUthXpMYJSUg'}
data = JSON.parse(adoptedResponse)
adopted = data["animals"]
# puts "#{animals_list[0]}"
# pet2 = "#{animals_list[1]}"
# pet3 = "#{animals_list[2]}"
# pet4 = "#{animals_list[3]}"
# pet5 = "#{animals_list[4]}"
i = 0
while i < 99 do
    pet = Pet.new(name: animals_list[i]['name'], breed: animals_list[i]['breeds']['primary'], age: animals_list[i]['age'], description: animals_list[i]['description'],
    location: animals_list[i]['city'], postedDate: animals_list[i]['published_at'], 
    size: animals_list[i]['size'], spayed_neutered: animals_list[i]['attributes']['spayed_neutered'], house_trained: animals_list[i]['attributes']['house_trained'],
    gender: animals_list[i]['gender'], colors: animals_list[i]['colors']['primary'], species: animals_list[i]['species'], isAdopted: false)
    if animals_list[i]['photos'].length > 0
        pet.update(imageUrl: animals_list[i]['photos'][0]['full'])
        pet.save
    end
    i = i+1
end

x = 0
while x < 99 do
    # imageVal = imageCheck(animals_list[i]['photos'][0]['full'])

    pet = Pet.new(name: adopted[x]['name'], breed: adopted[x]['breeds']['primary'], age: adopted[x]['age'], description: adopted[x]['description'],
    location: adopted[x]['city'], postedDate: adopted[x]['published_at'], 
    size: adopted[x]['size'], spayed_neutered: adopted[x]['attributes']['spayed_neutered'], house_trained: adopted[x]['attributes']['house_trained'],
    gender: adopted[x]['gender'], colors: adopted[x]['colors']['primary'], species: adopted[x]['species'], isAdopted: true)
    if adopted[x]['photos'].length > 0
        pet.update(imageUrl: adopted[x]['photos'][0]['full'])
        pet.save
    end
    x = x+1
end

puts "seeding data"

# "name" = [name]
# "breed" = ['breeds']['primary']
# "age" = ['age']
# "description" = ['description']
# "location" = ['city']['state']
# "imageUrl" = ['photos'][0]['full']
# "postedDate" = ['published_at']
# "size" = ['size']
# "spayed_neutered" = ['attributes']['spayed_neutered']
# house_trained = ['attributes']['house_trained']
# gender = ['gender']
# colors = ['colors']['primary']
# 'species' = ['species']

#     t.boolean "isAdopted"