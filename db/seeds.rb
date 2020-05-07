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
authToken = "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6ImRjMzVmNjkwNzI0NTg4NGExZjdmMDUxZDY4MmQwMjIwOGY1MmEyZTRmNDlkYThjN2U2NWNkZTgxNzFiYzVjZTM5NDE0ZGFiYTZlNjM4MGZiIiwiaWF0IjoxNTg4ODc5OTE4LCJuYmYiOjE1ODg4Nzk5MTgsImV4cCI6MTU4ODg4MzUxOCwic3ViIjoiIiwic2NvcGVzIjpbXX0.nnu5L3Ekfvx04E8eirxr2x9q03JQF-wW0pnmRmtMO-6phLeyz3Y3jvzHlmfKxE2Tp7Mwx6oRYCP0bRKyD46MLHQbBg3ShbBEsNhRDms0PgBQ3_ZA82onwvijWHK32jAmCPBcBMOM4bW9oxY8JzZA-pfUQTPEqZeEM2f51evPd0L9RlngBeErvFRZ9JQYO_7VBxce2pfhmYfXtdP94NMz2olgDtJaDUbNOWbffGlBRqWL76dG_irjEMUt1A__FNzbbYWbLN73DY6HbBGYA-lANv7eRFAZQSElYTWTYrbCZbY-4Bj93n2Et7qqBN0J3sH8vD6aHbc3NHEUthXpMYJSUg"
response = RestClient.get 'https://api.petfinder.com/v2/animals?limit=100', {:Authorization => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6IjQ3MGYwZWVlZjI1Y2E0ODZkNjBiY2E1NTE1NWE4ZTNlNmI1NjBiOGUwNmZmNzVmYTRiMjFlMmMzMzQ1MzNjZGViYzNkOTI5NzFkNmE3M2Q4IiwiaWF0IjoxNTg4Nzk5NzYwLCJuYmYiOjE1ODg3OTk3NjAsImV4cCI6MTU4ODgwMzM2MCwic3ViIjoiIiwic2NvcGVzIjpbXX0.vRIyKVD5Gtt-fsbtfm-bjEso2uy-yaM42k-QaYEPYB872MOGxzuH2AT4DqANFC8VBUl7E3IQ2X8rNmdDklK9uqPZ7Zbob6vM46cTEp4fyU7M0aB_ZdHGeFrdMGP07TOJ18jaT3KrfDZv0JGfSM19ZDmYHJdJT08CFF7BtIJ2mv6vF4UOmOjWSRXO0N8iGpNCNNz5UjQpAMvZEyeDYBnV7v0sNp2CGysIkeDkaCBKpShBcf3fAnxgF2UaEStegVgPHQ8lEbd0jGHQdB7UtWRqt9tTyWCgR6w8SVgx6vrk198Av35FPwUSS5oop9j2HfUAjbMQLMqxjIulvXMHm5GW8g'}

data = JSON.parse(response)
animals_list = data["animals"]

response = RestClient.get 'https://api.petfinder.com/v2/animals?limit=100&page=20', {:Authorization => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6IjQ3MGYwZWVlZjI1Y2E0ODZkNjBiY2E1NTE1NWE4ZTNlNmI1NjBiOGUwNmZmNzVmYTRiMjFlMmMzMzQ1MzNjZGViYzNkOTI5NzFkNmE3M2Q4IiwiaWF0IjoxNTg4Nzk5NzYwLCJuYmYiOjE1ODg3OTk3NjAsImV4cCI6MTU4ODgwMzM2MCwic3ViIjoiIiwic2NvcGVzIjpbXX0.vRIyKVD5Gtt-fsbtfm-bjEso2uy-yaM42k-QaYEPYB872MOGxzuH2AT4DqANFC8VBUl7E3IQ2X8rNmdDklK9uqPZ7Zbob6vM46cTEp4fyU7M0aB_ZdHGeFrdMGP07TOJ18jaT3KrfDZv0JGfSM19ZDmYHJdJT08CFF7BtIJ2mv6vF4UOmOjWSRXO0N8iGpNCNNz5UjQpAMvZEyeDYBnV7v0sNp2CGysIkeDkaCBKpShBcf3fAnxgF2UaEStegVgPHQ8lEbd0jGHQdB7UtWRqt9tTyWCgR6w8SVgx6vrk198Av35FPwUSS5oop9j2HfUAjbMQLMqxjIulvXMHm5GW8g'}
data = JSON.parse(response)
adopted = data["animals"]
# puts "#{animals_list[0]}"
# pet2 = "#{animals_list[1]}"
# pet3 = "#{animals_list[2]}"
# pet4 = "#{animals_list[3]}"
# pet5 = "#{animals_list[4]}"
Pet.destroy_all
i = 0
while i < 99 do
    # imageVal = imageCheck(animals_list[i]['photos'][0]['full'])

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

while i < 99 do
    # imageVal = imageCheck(animals_list[i]['photos'][0]['full'])

    pet = Pet.new(name: adopted[i]['name'], breed: adopted[i]['breeds']['primary'], age: adopted[i]['age'], description: adopted[i]['description'],
    location: adopted[i]['city'], postedDate: adopted[i]['published_at'], 
    size: adopted[i]['size'], spayed_neutered: adopted[i]['attributes']['spayed_neutered'], house_trained: adopted[i]['attributes']['house_trained'],
    gender: adopted[i]['gender'], colors: adopted[i]['colors']['primary'], species: adopted[i]['species'], isAdopted: true)
    if adopted[i]['photos'].length > 0
        pet.update(imageUrl: adopted[i]['photos'][0]['full'])
        pet.save
    end
    i = i+1
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