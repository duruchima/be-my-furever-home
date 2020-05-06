require 'byebug'
require 'rest-client'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


authToken = "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6ImUzMDI3ZDhjOTdiZTFlY2E1NTU1Y2RjOWJkZTAwM2I4NTUyMzFlM2I0Y2U4ZjEyZjQ3ZDQ5ODllZmYzNjg3ODQ0NzE1OWFlZjZiMDU5OTI4IiwiaWF0IjoxNTg4Nzc1MDM0LCJuYmYiOjE1ODg3NzUwMzQsImV4cCI6MTU4ODc3ODYzNCwic3ViIjoiIiwic2NvcGVzIjpbXX0.Xah2dYi8UVYGRYX9Q_A3nw06dPWQIARuZrFLLHo8AR73uMoi1m6XFzHCQywZvJVVpXtQkJKzU0IMjOuo2REQpUc7uZJKFAxqWKm-uA0Mw00N2NSf57FmSD4O8RPsUi9QWgGl_CzmXrxHc0kk1tBz7-HZedCQEQTMLfPTGf-NvmHNwhV2AmXtoWby198Gs6-9TYEDfYXiOsq6SACCdoMsRUP0AWqPlrzEnwXUk4JJCCmzsarxTiltYrDaZSnP72_fZqIKBou4Jnwb5HYV8tDrmgzrJaxBLcp45GlLiBF6KcxRnh7k1sGEiYsUDHY33OWRhpvps6SL4cAZaEJtFUzOHw"
response = RestClient.get 'https://api.petfinder.com/v2/animals?limit=100', {:Authorization => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6IjE1NjI4YWUwYTc4NzcwNmM3YjQzYzRlZmNkNWU0ODQwNTE4Y2Y5YTQxNGE5YTY2MjgxNzI1YzQyNzBjZTA0ZGU1ZWMzM2I4ZDc4NTUzZWJkIiwiaWF0IjoxNTg4Nzc0MjMwLCJuYmYiOjE1ODg3NzQyMzAsImV4cCI6MTU4ODc3NzgzMCwic3ViIjoiIiwic2NvcGVzIjpbXX0.hjFR6n2YbUj03EJJQxFAJ9kJmXSE3J5ZEEPWTJ-mn1WUE_VetekiRzqiA2d97ZYEbCEi2fR198YrKGZ1ZPWnceX7PxM_6pR-V42dVCXOhMLnnmvOU7m9QrG6xHk6vtWt8icgaCdjfa4UYgAtXNRRebq86oD-BKecGuL6wZyzb18eTeO1TttEj0d79wbKnMrWgi_JbjLYJzp72svk7MTW4c0VdJd_t-tjM9QAxEHvcAEfUewqnqulYXZyVI1o465-X6IP8GPXtQxLeVlHxaeXLkZLekF_dOBR-5f7am_Wob4gr-h7InmWIqkQqax69316NUAXV7WxTRNrVbP_XBgTfg'}

data = JSON.parse(response)
animals_list = data["animals"]
# puts "#{animals_list[0]}"
# pet2 = "#{animals_list[1]}"
# pet3 = "#{animals_list[2]}"
# pet4 = "#{animals_list[3]}"
# pet5 = "#{animals_list[4]}"
Pet.destroy_all
i = 0
while i < 99 do
    # imageVal = imageCheck(animals_list[i]['photos'][0]['full'])

    pet = Pet.create(name: animals_list[i]['name'], breed: animals_list[i]['breeds']['primary'], age: animals_list[i]['age'], description: animals_list[i]['description'],
    location: animals_list[i]['city'], postedDate: animals_list[i]['published_at'], 
    size: animals_list[i]['size'], spayed_neutered: animals_list[i]['attributes']['spayed_neutered'], house_trained: animals_list[i]['attributes']['house_trained'],
    gender: animals_list[i]['gender'], colors: animals_list[i]['colors']['primary'], species: animals_list[i]['species'], isAdopted: false)
    if animals_list[i]['photos'].length > 0
        pet.update(imageUrl: animals_list[i]['photos'][0]['full'])
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