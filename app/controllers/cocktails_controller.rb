class CocktailsController < ApplicationController
    before_action :find_cocktail, only: [ :show, :destroy ]
    def index
        @cocktails = Cocktail.all
    end

    def show
    end

    def new
        @cocktails = Cocktail.new
    end

    def create
        @cocktails = Cocktail.new(cocktail_params)
        if @cocktails.save
            redirect_to cocktail_path(@cocktails)
        else
            render :new
        end
    end
    
    def destroy
       @cocktails.destroy
       redirect_to root_path
    end

    private

    def find_cocktail 
        @cocktails = Cocktail.find(params[:id])
    end

    def cocktail_params
        params.require(:cocktail).permit(:name, :photo)
    end
end
