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
authToken = "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6ImUzMDI3ZDhjOTdiZTFlY2E1NTU1Y2RjOWJkZTAwM2I4NTUyMzFlM2I0Y2U4ZjEyZjQ3ZDQ5ODllZmYzNjg3ODQ0NzE1OWFlZjZiMDU5OTI4IiwiaWF0IjoxNTg4Nzc1MDM0LCJuYmYiOjE1ODg3NzUwMzQsImV4cCI6MTU4ODc3ODYzNCwic3ViIjoiIiwic2NvcGVzIjpbXX0.Xah2dYi8UVYGRYX9Q_A3nw06dPWQIARuZrFLLHo8AR73uMoi1m6XFzHCQywZvJVVpXtQkJKzU0IMjOuo2REQpUc7uZJKFAxqWKm-uA0Mw00N2NSf57FmSD4O8RPsUi9QWgGl_CzmXrxHc0kk1tBz7-HZedCQEQTMLfPTGf-NvmHNwhV2AmXtoWby198Gs6-9TYEDfYXiOsq6SACCdoMsRUP0AWqPlrzEnwXUk4JJCCmzsarxTiltYrDaZSnP72_fZqIKBou4Jnwb5HYV8tDrmgzrJaxBLcp45GlLiBF6KcxRnh7k1sGEiYsUDHY33OWRhpvps6SL4cAZaEJtFUzOHw"
response = RestClient.get 'https://api.petfinder.com/v2/animals?limit=100', {:Authorization => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6ImQxMWZhYmJkNTE4NDY3NTYwZWZlMGI5ODViMTQxOGZjYjNiMGQxMmI3NDg0MzI0NTBhNWI1OGY3ZjllOWViYmUwMTEzNTk3Yzg0ZDVjMDhiIiwiaWF0IjoxNTg4Nzk0NzEzLCJuYmYiOjE1ODg3OTQ3MTMsImV4cCI6MTU4ODc5ODMxMywic3ViIjoiIiwic2NvcGVzIjpbXX0.two3cL8aigF6rR_u9DnyHmh-JyC3T-ViXoFXFH9r2-z4bAarMsvdHw_1DYJTct5b3JJtw0b-0TUGnOUq51cV521A_8fBIbbbeK-KsUoG6yaeqpcY7_XbuzRZvv7QllckuX2zzPeiTUgVAOhun4wbi8w-EL5POXhYXiztxal5r7tiJPHWmqZSKfWST44rfKUFMlNgGJnDSIqq20MBOrD8VRv7RUJTHp6GA-FteY_6mBEEBsTa7m-R3GLzP3XmLQd9QjxxBmGjkHUhYyy3X745Ul94QcDFjUw7Jue73zgl0-zNYBVMB9nICUkDQkrVFRTDv1Njol7SsHuvLp5z3KUATg'}

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