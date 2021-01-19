class IngredientsController < ApplicationController

    def index
        @ingredients = Ingredient.all
    end

    def new 
        @ingredient = Ingredient.new
    end

    def edit
        find_ingredient
    end

    def update
        find_ingredient
        @ingredient.update(ingredient_params)
        redirect_to ingredients_path
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)
        
        if @ingredient.save
            redirect_to ingredients_path 
        else
            render :new

        end
    end

    def find_ingredient
        @ingredient = Ingredient.find_by_id(params[:id])
    end

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
end
