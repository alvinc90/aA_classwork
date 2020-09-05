class CatsController < ApplicationController
    def index
        @cats = Cat.all
        #render json: @cats
        render :index
    end

    def show 
        @cat = Cat.find(params[:id]) 
        # render json: @cat 
        render :show
    end

    def new
        @cat = Cat.new #dummy cat
        render :new
    end
    # name: timmy 
    # color: black
    # sex:

    def create
        @cat = Cat.new(cat_params) ##

        if @cat.save
            redirect_to cat_url(@cat)
        else
            render :new
            #redirect_to new_cat_url
        end
    end

    def edit
        @cat = Cat.find(params[:id])
        render :edit
    end

    def update
        @cat = Cat.find(params[:id])

        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else
            render :edit
        end

    end

    private
    def cat_params
        params.require(:cat).permit(:name,:color,:sex,:description,:birth_date)
    end
end
