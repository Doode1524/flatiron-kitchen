class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)

        if @recipe.save
            redirect_to recipes_path
        else
            render :new
        end
    end

    def edit
        find_recipe
    end

    def update  
        find_recipe
        @recipe.update(recipe_params)

        if @recipe.save
            redirect_to recipes_path
        else
            render :edit
        end
    end

    def find_recipe
        @recipe = Recipe.find_by_id(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end
end
