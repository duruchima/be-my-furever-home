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
authToken = {:Authorization => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6IjFkMGZkNmM4N2EwZTBhMTdhYzk2YjY5ZjdlMWYzZjZlN2FhMmJmZmU5OGFjY2NhZjY3Yjc4ZGU3NjA4NDg5NmI3NGRkYTE0YWZkZjMzYjM0IiwiaWF0IjoxNTg4OTYxNDg1LCJuYmYiOjE1ODg5NjE0ODUsImV4cCI6MTU4ODk2NTA4NSwic3ViIjoiIiwic2NvcGVzIjpbXX0.at9QlUruGXo55jw0oo-ISBizaKd4hVOjNb2HkPaQSzn0NonzMvp0daR-B6cUnejvMTjdKsiHEOH_j9roJtIfyascZys18Xu1tTTAPs9Yoy_EmLui7tJxLfEB9uxYPVyZ7SMEq0lFo3kbOSJxAbIXsDWg7ZUJUDJV2l2NrJ-LnhztaI64qNZyPNy3xfU3yXK-Rr_cjjcKrL5h5mqsqVSVJK5z5xkqV4MHtq81L3Xwqm3f2AfqkaBzuiQMypXTAQGBXggLyhK9zKj3gYjJ1SAAnRjcvqR51iLCKxCE6GH35M498G3tnpW7ZXAlajZtE2JBa8idNMwswnSD-5SVze7dfQ'}
response = RestClient.get 'https://api.petfinder.com/v2/animals?limit=100', authToken

data = JSON.parse(response)
animals_list = data["animals"]

response1 = RestClient.get 'https://api.petfinder.com/v2/animals?limit=100&page=20', authToken
data1 = JSON.parse(response1)
adopted = data1["animals"]

i = 0
while i < 99 do

    pet = Pet.new(name: animals_list[i]['name'], breed: animals_list[i]['breeds']['primary'], age: animals_list[i]['age'],
    location: animals_list[i]['city'], postedDate: animals_list[i]['published_at'], 
    size: animals_list[i]['size'], spayed_neutered: animals_list[i]['attributes']['spayed_neutered'], house_trained: animals_list[i]['attributes']['house_trained'],
    gender: animals_list[i]['gender'], colors: animals_list[i]['colors']['primary'], species: animals_list[i]['species'], isAdopted: false)
    if animals_list[i]['photos'].length > 0 && animals_list[i]['description'] != nil
        pet.update(imageUrl: animals_list[i]['photos'][0]['full'])
        pet.update(description: animals_list[i]['description'])
        pet.save
    end
    i = i+1
end

x = 0
while x < 99 do

    pet = Pet.new(name: adopted[x]['name'], breed: adopted[x]['breeds']['primary'], age: adopted[x]['age'],
    location: adopted[x]['city'], postedDate: adopted[x]['published_at'], 
    size: adopted[x]['size'], spayed_neutered: adopted[x]['attributes']['spayed_neutered'], house_trained: adopted[x]['attributes']['house_trained'],
    gender: adopted[x]['gender'], colors: adopted[x]['colors']['primary'], species: adopted[x]['species'], isAdopted: true)
    if adopted[x]['photos'].length > 0 && adopted[x]['description'] != nil
        pet.update(imageUrl: adopted[x]['photos'][0]['full'])
        pet.update(description: adopted[x]['description'])
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