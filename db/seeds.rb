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
response = RestClient.get 'https://api.petfinder.com/v2/animals', {:Authorization => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6IjNiZWVmNzk1Y2MyMTY0NmY0ZjFmMGNmZTM1M2VhZjgwZDVlMjdhY2M5OTA3MzljMGMxMzhkZjczZjNlZjIwMTA3ODEwNGZmYWEyYWRiMTdmIiwiaWF0IjoxNTg4NzE0MDU1LCJuYmYiOjE1ODg3MTQwNTUsImV4cCI6MTU4ODcxNzY1NSwic3ViIjoiIiwic2NvcGVzIjpbXX0.L_RPWWbsKFH5gHpNNnzsD8s7J5HAXFg6xFhKUFLAuocPPFR2ohfDPLwQH1MDiPVy0jEyt71BuqajSHHKqhrrYmqZHmPzkeC9q8--ZoL33Wz_FH6hhHj--ueRfRnVyG0DFl6wvbiBDHiiMrZOcyqFYm-_t9dEgMy1sYdvk-bDa-NqjqVVgP5jhyyEpZ5y3ubJs57p5suumh28--v0ELomptF8sSLUG39DA1-Ljopd4Cvz3qBkbPjZ-8VrHUjaaMsY-pU49immXDZ7YbHaSi5w-hHkHRVvlt-UyM2P8vuDWnM9Ga5sqz2dTfPIeSyYT_cIE3WpQeq47gvNYPwDroBg2g'}
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
def imageCheck(image)
   if image 
         return image
   else return ""
   end
end
while i < 15 do
    # imageVal = imageCheck(animals_list[i]['photos'][0]['full'])

    pet = Pet.create(name: animals_list[i]['name'], breed: animals_list[i]['breeds']['primary'], age: animals_list[i]['age'], description: animals_list[i]['description'],
    location: animals_list[i]['city'], postedDate: animals_list[i]['published_at'], 
    size: animals_list[i]['size'], spayed_neutered: animals_list[i]['attributes']['spayed_neutered'], house_trained: animals_list[i]['attributes']['house_trained'],
    gender: animals_list[i]['gender'], colors: animals_list[i]['colors']['primary'], species: animals_list[i]['species'], isAdopted: false)
    # if animals_list[i]['photos'][0]
    #     pet.imageUrl = animals_list[i]['photos'][0]['full']
    # end
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