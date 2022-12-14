class ReviewsController < ApplicationController

    def index
        # this is our list page for our reviews

        @price = params[:price]
        @cuisine = params[:cuisine]
        @address = params[:address]

        # start with all reviews
        @reviews = Review.all

        # filtering by price
        if @price.present?
            @reviews = @reviews.where(price: @price)
        end

        # filtering by cuisine
        if @cuisine.present?
            @reviews = @reviews.where(cuisine: @cuisine)
        end

        # search near location
        if @address.present?
            @reviews = @reviews.near(@address)
        end

        @number = rand(1..1000)

        @reviews = Review.all
        
    end


    def new

        @review = Review.new

    end

    def create

        # take info from form and add it to the DB
        @review = Review.new(form_params)

        # check if the model can be saved
        # if it can, redirect to home page
        # if it can't, show the new form with errors (_form.html.erb)
        if @review.save
            redirect_to root_path

        else 
            # show the view for new.html.erb
            render "new"

        end

    end

    def show

        # individual review page
        @review  = Review.find(params[:id])

    end

    def edit

        # find the individual review
        @review = Review.find(params[:id])

    end

    def update

        # find individual review
        @review = Review.find(params[:id])

        # update with new info from form
        if @review.update(form_params)

            # redirect to individual review page
            redirect_to review_path(@review)
        
        else 

            render "edit"
        
        end

    end

    def destroy

        # find the individual review
        @review = Review.find(params[:id])

        # destroy
        @review.destroy

        # redirect to homepage
        redirect_to root_path

    end

    def form_params

        params.require(:review). permit(:title, :restaurant, :body, :score, :ambiance, :cuisine, :price, :address)

    end

end
