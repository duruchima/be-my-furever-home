class PetsController < ApplicationController
    def index
        token = curl -d `grant_type=client_credentials&client_id=#{ENV["PETFINDER_KEY"]}&client_secret=#{ENV["PETFINDER_SECRET"]}` https://api.petfinder.com/v2/oauth2/token
    end
end
