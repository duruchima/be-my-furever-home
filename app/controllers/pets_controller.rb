class PetsController < ApplicationController
    def index
        @pets = Pet.all
        render json:@pets
    end
    
    def show
        @pet = Pet.find(params[:id])
        render json:@pet
    end

    private

    def sub_category_params
        params.require(:pet).permit(:pet_id)
    end
end
