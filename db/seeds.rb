require 'byebug'
require 'rest-client'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# token = curl -d "grant_type=client_credentials&client_id=kgB45Lkw0KZ5vqPtQJDcPsncHc45YkBYj3h0ZqJonWSO0bY1kB&client_secret=5aHa9WpC5ZrtrB7MpB030JwM5o1SGyeOZBoBTS3E" https://api.petfinder.com/v2/oauth2/token 
# byebug
# puts "seeding data"

# {"token_type":"Bearer","expires_in":3600,"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6IjA3ZThmZmNjMjE5MTYwNzJjNjU5YmZkZjA1MjZhYTUzZTk3ZTBiODM1MTRiNGExMjhkYjJjNjk4NjhlYzJhZmViNjM1MTcyMjllZjc0MTQxIiwiaWF0IjoxNTg4NzA1NTMwLCJuYmYiOjE1ODg3MDU1MzAsImV4cCI6MTU4ODcwOTEzMCwic3ViIjoiIiwic2NvcGVzIjpbXX0.hpOCweJNVLaZr4a0yxkVOUxAwOED4NUV32CwQqdcQaA7-3pWDw6EizHgTdpgsKGFoRolqXzfGtb-seyUEuw3Ll4dkgcGUksjvt95gkpIwsmJOIPyICQGNHLXNj-cU0Z2ijYDDOqpkNd6pSFQuKWjSKKieOWF654Cwa5_VzMyUtDFrcT4DzdlU3EUdOFiCl4HHZlqX8gRFQKHydPyKLucwcMu53fq_t9GDBrTzzYu_M12TczT0I7vNR-psWI1Mu6oVknz_r6Sg-YaWjk6Z2IJ3_dozh2Sr-PLway5Xtp7KUbCza8iE8LzC89a7eX2zcCSkgW49KmD2DCnfDfTZ0ZXJA"}
# curl -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6IjZlOGJmNjhlN2EzYjgzMmFmZjI4MWFhMWU2MGU2ZGMxMjMyZGJjNDYzNGIyMzBmYjNiM2MwMTBjYWZkYzE3M2Y1MmVjZDk0YzliYTM0NzZhIiwiaWF0IjoxNTg4Njk5NTY5LCJuYmYiOjE1ODg2OTk1NjksImV4cCI6MTU4ODcwMzE2OSwic3ViIjoiIiwic2NvcGVzIjpbXX0.d51ciX1Wgo5KMJwZAtlRiWgbHUXoMjpBl8hX2b-mARZwikl8udIKaSzoznZfyvkk6SIzXiJ2F-CimuiovqJFtAVoM-eCzCXbkPqvPIF-1f7K0SyyuHYzCBzARQN7U0Bh_43ys7PAHXYmGhgNuEPGSpIoZWqs4cPFtbZOnjvcvk1Yrw3P6clfUaMcHKGBCu_GkXWyGP7MJibHNPqJ46VlSOBYGRgdr0GAkOvLpzirD9Geq26Z0ciLPSrxTXPPh3Uh4__V4lU8wro_kjkVYsetzcTk4tZ_QTGIevd_KPJZksprOGm5KGdSHboRQPUh5FlcehyAHrzc-vppe6aWfY09og" GET https://api.petfinder.com/v2/animals/{ACTION}?{parameter_1}={value_1}&{parameter_2}={value_2}
authToken = "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6ImU5YmM5Y2Q2MWU0Y2I1YzJlYjU3OGUxYjQ4Nzg3NzRhZWMyNTNiYTk0MDRhMDIyY2M5YjhkMzQyMzU4MGM0MjY5ZDc4MWQwNmUxNmRjZjdhIiwiaWF0IjoxNTg4NzA5Mjk0LCJuYmYiOjE1ODg3MDkyOTQsImV4cCI6MTU4ODcxMjg5NCwic3ViIjoiIiwic2NvcGVzIjpbXX0.tJmcFhv3wzk9gjKIeCXusoGffhPNUxJ9WPNiIVWwVF1pNbBs0mUl8BkH3iM2NxQdyaHCrRHdEJaUnaiqIPCHkLkDkp5V8iv5cTRhYL13iWIKAK8t72vDK3Kp6J87yrrl0i-wumGYm4vUFkSUNHE6PWW4Ef-fe2rBHR3oRW8u6v9bO_G32zay-NyoFkpkW8aTq15w9jt3eQ_2VtcWVeP5AWk3l1roRwugKGhyX1EqOZrbMqArEkxBPGfb-Ztg0XwM4wy_11qSTSFZOKqdw6Xsu0wOBQMzNSGEAGT-Df8k5-qBvG_nRndTYxAs2P-OzQiMHFLuhJyF0NholR4croxS1w"
response = RestClient.get 'https://api.petfinder.com/v2/animals', {:Authorization => 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJrZ0I0NUxrdzBLWjV2cVB0UUpEY1BzbmNIYzQ1WWtCWWozaDBacUpvbldTTzBiWTFrQiIsImp0aSI6IjZkYzhjNDdmM2VmN2ViMWU4OGRkMmQ2N2IyZTdjYzU3MTYxMzBmYmNhOTEyNzIyMzY0NmRkNzI3Nzg0ZDk2MTk3MjNjZDQ1ZmYyYmIwMmY3IiwiaWF0IjoxNTg4NzExNzc4LCJuYmYiOjE1ODg3MTE3NzgsImV4cCI6MTU4ODcxNTM3OCwic3ViIjoiIiwic2NvcGVzIjpbXX0.ceiZON69orlOJ73-DvEjZ9rz4d1PXkFqPDVJ8tLCoPt1PWY9_N161W8xFa2szT3CPHyTgRerc-jYpJ126nrcp-DRvaMzXCgfL7jDMlN5Qt0KMuM278aMVJzEN1ZaTWMQ-6wXtTVyDc859FHzovofpszjDf0ut3Vvtg5bBrvZrdk0KZzRrg_Cwx9cUIV0MyX2h4Nd4Tf1SIIxmXMB5MJz9z9T4fCMt-jCthud54pzMyam1cUrISQlFIGQG502WEDlXk_oesS28Q942Re8vv570KRnuoY8YwN4y9LWmN9G35FiP3UwMba-H4DseFPubKg7CugOdXDP-oUpKy8oT10Jzw'}
response.code
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
    location: animals_list[i]['city'], imageUrl: animals_list[i]['photos'][0]['full'], postedDate: animals_list[i]['published_at'],
    size: animals_list[i]['size'], spayed_neutered: animals_list[i]['attributes']['spayed_neutered'], house_trained: animals_list[i]['attributes']['house_trained'],
    gender: animals_list[i]['gender'], colors: animals_list[i]['colors']['primary'], species: animals_list[i]['species'], isAdopted: false)
    i = i+1
    byebug
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