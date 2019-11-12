class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :destroy, :update]

  def index
      # @restaurants = Restaurant.all
    # now goes to the view before moving onto other methods
    # want to show latest first so change to
    @restaurants = Restaurant.all.order(created_at: :desc)
  end

  def show
    # @restaurant = Restaurant.find(?)
    # has dynamic variable, so need to find with params
        # @restaurant = Restaurant.find(params[:id]) see before_action
    # params[:id] is a string, but this is so common active record handles this for you
  end

  def new
    # new create edit update are all very similar
    # new has form
    @restaurant = Restaurant.new
  end

  def create
    # Restaurant.create(name: params[:name], address: params[:address],...)
    # if you had 20 fields you have to do this all over again...
    #   so instead you do this:
    # <form action="/restaurants" method="post">
    #   <!-- the above is found from looking at the routes page -->
    #   <%= hidden_field_tag :authenticity_token, form_authenticity_token %>
    #   <input type="text" name="restaurant[name]" />
    #   <input type="text" name="restaurant[address]" />
    #   <input type="number" name="restaurant[rating]" />
    #   <input type="submit" />
    # </form>
    # difference is, when you submit, all of the attributes are inside a restaurant hash
    # so can do this:
          # Restaurant.create(params[:restaurant])
    # but you cannot do this... in rails
    # lets say you have a feild, which is true or false
    # published starts as fale, and can be set to true by admin
    # final users can only see restaurants which were published
    # could go to this form in the app... if I was a hacker...
    # inspect, and add a new field, like name="restaurant[publsiehd]" value="true",
    # then you are submitting...
    # now you've been hacked!
    # so you need to do something else... whitelist what has been accepted
    # create private method
    Restaurant.create(restaurant_params)
    # don't need to send params as they are more global... or something

    redirect_to restaurants_path
    # this now allows feedback...
  end

  def edit
    # @restaurant = Restaurant.find(params[:id])
  end

  def update
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    # .update is an instance method, which updates and saves - you are not calling the method on its own method

    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private

  # strong parameters
  # whitelist what you acccept
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
    # now when I submit it works,
    #  but I don't get any feedback
    #  so check rails server
    # No template found for RestaurantsController#create, rendering head :no_content
    # Completed 204 No Content in 39ms (ActiveRecord: 3.2ms)
    # so path does not go anywhere yet
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    # but don't need to do this...
    # rails has
      #  before_action :set_restaurant
    # but index doesn't need it
    # so have only and execpt options
  end

end
