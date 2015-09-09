class StylesController < ApplicationController
    
    def new
        @style = Style.new
    end
    
    def create
        @style = Style.new(style_params)
        if @style.save
            flash[:success] = "Your Style has been created Successfully"
            redirect_to recipes_path
        else
            render :new
        end
            
    end
    
    private
      
       def style_params
           params.require(:style).permit(:name)
       end

end
