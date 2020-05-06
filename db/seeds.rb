require 'byebug'
require 'rest-client'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


authToken = "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6ImU5YmM5Y2Q2MWU0Y2I1YzJlYjU3OGUxYjQ4Nzg3NzRhZWMyNTNiYTk0MDRhMDIyY2M5YjhkMzQyMzU4MGM0MjY5ZDc4MWQwNmUxNmRjZjdhIiwiaWF0IjoxNTg4NzA5Mjk0LCJuYmYiOjE1ODg3MDkyOTQsImV4cCI6MTU4ODcxMjg5NCwic3ViIjoiIiwic2NvcGVzIjpbXX0.tJmcFhv3wzk9gjKIeCXusoGffhPNUxJ9WPNiIVWwVF1pNbBs0mUl8BkH3iM2NxQdyaHCrRHdEJaUnaiqIPCHkLkDkp5V8iv5cTRhYL13iWIKAK8t72vDK3Kp6J87yrrl0i-wumGYm4vUFkSUNHE6PWW4Ef-fe2rBHR3oRW8u6v9bO_G32zay-NyoFkpkW8aTq15w9jt3eQ_2VtcWVeP5AWk3l1roRwugKGhyX1EqOZrbMqArEkxBPGfb-Ztg0XwM4wy_11qSTSFZOKqdw6Xsu0wOBQMzNSGEAGT-Df8k5-qBvG_nRndTYxAs2P-OzQiMHFLuhJyF0NholR4croxS1w"
response = RestClient.get 'https://api.petfinder.com/v2/animals', {:Authorization => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6ImUzMDI3ZDhjOTdiZTFlY2E1NTU1Y2RjOWJkZTAwM2I4NTUyMzFlM2I0Y2U4ZjEyZjQ3ZDQ5ODllZmYzNjg3ODQ0NzE1OWFlZjZiMDU5OTI4IiwiaWF0IjoxNTg4Nzc1MDM0LCJuYmYiOjE1ODg3NzUwMzQsImV4cCI6MTU4ODc3ODYzNCwic3ViIjoiIiwic2NvcGVzIjpbXX0.Xah2dYi8UVYGRYX9Q_A3nw06dPWQIARuZrFLLHo8AR73uMoi1m6XFzHCQywZvJVVpXtQkJKzU0IMjOuo2REQpUc7uZJKFAxqWKm-uA0Mw00N2NSf57FmSD4O8RPsUi9QWgGl_CzmXrxHc0kk1tBz7-HZedCQEQTMLfPTGf-NvmHNwhV2AmXtoWby198Gs6-9TYEDfYXiOsq6SACCdoMsRUP0AWqPlrzEnwXUk4JJCCmzsarxTiltYrDaZSnP72_fZqIKBou4Jnwb5HYV8tDrmgzrJaxBLcp45GlLiBF6KcxRnh7k1sGEiYsUDHY33OWRhpvps6SL4cAZaEJtFUzOHw'}
# response.code
data = JSON.parse(response)
animals_list = data["animals"]
# puts "#{animals_list[0]}"
# pet2 = "#{animals_list[1]}"
# pet3 = "#{animals_list[2]}"
# pet4 = "#{animals_list[3]}"
# pet5 = "#{animals_list[4]}"
Pet.destroy_all
i = 0
while i < 15 do
    pet = Pet.create(name: animals_list[i]['name'], breed: animals_list[i]['breeds']['primary'], age: animals_list[i]['age'], description: animals_list[i]['description'],
    location: animals_list[i]['city'], postedDate: animals_list[i]['published_at'], 
    size: animals_list[i]['size'], spayed_neutered: animals_list[i]['attributes']['spayed_neutered'], house_trained: animals_list[i]['attributes']['house_trained'],
    gender: animals_list[i]['gender'], colors: animals_list[i]['colors']['primary'], species: animals_list[i]['species'], isAdopted: false)
    if animals_list[i]['photos'][0]
        pet.imageUrl = animals_list[i]['photos'][0]['full']
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