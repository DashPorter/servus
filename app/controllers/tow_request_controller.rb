class TowRequestController < ApplicationController
  get '/tow_requests' do
    if dispatcher?
      @tow_requests = TowRequest.all
    elsif current_user
      @tow_requests = current_user.tow_requests
    end
    
    @pending_tows = @tow_requests.where(status: 'Pending')
    @active_tows = @tow_requests.where(status: 'Active')
    @completed_tows = @tow_requests.where(status: 'Completed')
    erb :'tow_requests/index'
  end

  get '/tow_requests/new' do
    @colors = %w(Beige Black Blue Brown Gold Gray Green Maroon Orange Pink Purple Red Silver Tan White Yellow)
    @states = %w(Alabama Alaska Arizona Arkansas California Colorado Connecticut Delaware Florida Georgia Hawaii Idaho Illinois Indiana Iowa Kansas Kentucky Louisiana Maine Maryland Massachusetts Michigan Minnesota Mississippi Missouri Montana Nebraska Nevada New\ Hampshire New\ Jersey New\ Mexico New\ York North\ Carolina North\ Dakota Ohio Oklahoma Oregon Pennsylvania Rhode\ Island South\ Carolina South\ Dakota Tennessee Texas Utah Vermont Virginia Washington West\ Virginia Wisconsin Wyoming)
    @drivers = Driver.all
    get_all_makes
    erb :'tow_requests/new'
  end

  post '/tow_requests' do
    @tow_request = TowRequest.create(params[:tow_request])
    @vehicle = @tow_request.create_vehicle(params[:vehicle])

    if @tow_request.valid? && @vehicle.valid?
      redirect to '/tow_requests'
    else
      erb :'tow_requests/new'
    end
  end

  put '/tow_requests/:id/complete' do
    @tow_request = TowRequest.find(params[:id])
    @tow_request.status = 'Completed'
    @tow_request.save
  
    redirect to "tow_requests"
  end

  get '/tow_requests/:id/edit' do
    @colors = %w(Beige Black Blue Brown Gold Gray Green Maroon Orange Pink Purple Red Silver Tan White Yellow)
    @states = %w(Alabama Alaska Arizona Arkansas California Colorado Connecticut Delaware Florida Georgia Hawaii Idaho Illinois Indiana Iowa Kansas Kentucky Louisiana Maine Maryland Massachusetts Michigan Minnesota Mississippi Missouri Montana Nebraska Nevada New\ Hampshire New\ Jersey New\ Mexico New\ York North\ Carolina North\ Dakota Ohio Oklahoma Oregon Pennsylvania Rhode\ Island South\ Carolina South\ Dakota Tennessee Texas Utah Vermont Virginia Washington West\ Virginia Wisconsin Wyoming)
    @drivers = Driver.all
    @tow_request = TowRequest.find(params[:id])
    @vehicle = @tow_request.vehicle
    if @vehicle
      get_all_makes
    end
    erb :'tow_requests/edit'
  end

  post '/tow_requests/:id/image' do
    @tow_request = TowRequest.find(params[:id])
    @vehicle = @tow_request.vehicle
    
    if params[:start_file]
      @vehicle.start_photo = params[:start_file]
    elsif params[:end_file]
      @vehicle.end_photo = params[:end_file]
    end
    @vehicle.save!

    redirect to "tow_requests/#{@tow_request.id}/edit"
  end

  put '/tow_requests/:id' do
    @tow_request = TowRequest.find(params[:id])
    @vehicle = @tow_request.vehicle
    if @tow_request.update_attributes(params[:tow_request]) && @vehicle.update_attributes(params[:vehicle])
      redirect to '/tow_requests'
    else
      erb :'tow_requests/edit'
    end
  end

  get '/tow_requests/:id' do
    @tow_request = TowRequest.find(params[:id])
    erb :'tow_requests/show'
  end

  delete '/tow_requests/:id/destroy' do
    @tow_request = TowRequest.find(params[:id])
    @tow_request.destroy
    redirect to '/tow_requests'
  end
end
