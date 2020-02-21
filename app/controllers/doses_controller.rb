class DosesController < ApplicationController
    before_action :find_cocktail, only: [ :new, :create ]
    def new
        @doses = Dose.new
    end

    def create
        @doses = Dose.new(doses_params)
        @doses.cocktail = @cocktails
        if @doses.save
            redirect_to cocktail_path(@cocktails)
        else
            render :new
        end
    end

    private

    def find_cocktail
        @cocktails = Cocktail.find(params[:cocktail_id])
    end

    def doses_params
        params.require(:dose).permit(:description,:ingredient_id)
    end
end
