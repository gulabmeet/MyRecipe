class RecipesController < ApplicationController

before_action :set_recipe, only: [:edit, :update, :like, :show]
before_action :require_user, except: [:show, :index]
before_action :require_same_user, only: [:edit, :update]
    def index
      @recipes = Recipe.paginate(page: params[:page], per_page: 4)
      
    end
    
    def show
        #@recipe = Recipe.find(params[:id])
    end
    
    def new
        @recipe = Recipe.new
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.chef = current_user         # we can not create only recipe without chef id
        if @recipe.save
            flash[:success] = "Your Recipe was created successfully!"
            redirect_to recipes_path
        else
            render :new
        end
    end
    
    def edit
        #@recipe = Recipe.find(params[:id])
    end
    
    def update
        #@recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_params)
            flash[:success] = "Recipe Updated successfully"
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
    end
    
    def like
       #@recipe = Recipe.find(params[:id])
       like = Like.create(like: params[:like], chef: current_user, recipe: @recipe)
       
       if like.valid?
         flash[:success] = "Your selection was successful"
         redirect_to :back
       else
           flash[:danger] = "You can Like/Dislike once"
           redirect_to :back
       end
    end
       
    
    private
    
     def recipe_params
         params.require(:recipe).permit(:name, :summary, :description, :picture)
     end
     
     def set_recipe
         @recipe = Recipe.find(params[:id]) 
     end
     
      def require_same_user
          if current_user != @recipe.chef
              flash[:danger] = "You can only edit your own Profile"
              redirect_to root_path
          end
      end
      
end