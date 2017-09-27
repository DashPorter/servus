require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'rack-flash'
require 'rubygems'
require 'bundler'
Bundler.setup
require 'sinatra'
require 'json'
require 'rest-client'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'password_security'
    CarrierWave.configure do |config|
      config.root = APP_ROOT + '/public'
    end
  end

  get '/' do
    if logged_in?
      @tow_user = current_user
      @active_tow = @tow_user.tow_requests.find_by(status: 'Active')
      erb :logged_in_index
    else
      erb :index
    end
  end

  get '/search' do
    @vehicle = Vehicle.find_by(params[:vehicle])
    if @vehicle
      redirect to "/tow_requests/#{@vehicle.tow_request.id}"
    else
      @errors = 'No vehicles found.'
      erb :index
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      TowUser.find(session[:user_id])
    end

    def dispatcher?
      logged_in? && TowUser.find(session[:user_id]).type == 'Dispatcher'
    end

    def redirect_if_not_logged_in
      if !logged_in?
        erb :'tow_users/login'
      end
    end

    def redirect_to_home_page
      if logged_in?
        @tow_user = current_user
        @active_tow = @tow_user.tow_requests.find_by(status: 'Active')
        erb :logged_in_index
      else
        erb :index
      end
    end

    def get_all_makes
      api_result = RestClient.get 'vpic.nhtsa.dot.gov/api/vehicles/GetMakesForVehicleType/car?format=json'
      jhash = JSON.parse(api_result)
      @makes = []
      jhash['Results'].each do |vehicle|
        @makes << vehicle['MakeName']
      end
      @makes = @makes.sort_by(&:downcase) 
    end

    # def get_models(make)
    #   api_result = RestClient.get "https://vpic.nhtsa.dot.gov/api/vehicles/getmodelsformake/#{make}?format=json"
    #   jhash = JSON.parse(api_result)

    #   @models = []
    #   jhash['Results'].each do |model|
    #     @models << model['Model_Name']
    #   end

    #   @models = @models.sort_by(&:downcase)
    # end
  end
end