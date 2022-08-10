class ReviewsController < ApplicationController

    def index
        # this is our list page for our reviews

        @number = rand(1..1000)

        @reviews = Review.all
        
    end


    def new

        @review = Review.new

    end

    def create

        # take info from form and add it to the DB
        @review = Review.new(form_params)

        # save as a new row to the DB
        @review.save

        # redirect back to the homepage
        redirect_to root_path

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
        @review.update(form_params)

        # redirect to individual review page
        redirect_to review_path(@review)

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

        params.require(:review). permit(:title, :body, :score)

    end

end
