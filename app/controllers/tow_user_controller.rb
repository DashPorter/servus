class TowUserController < ApplicationController
  get '/signup' do
    if !logged_in?
      erb :'tow_users/new'
    else
      redirect_to_home_page
    end
  end

  post '/signup' do
    @tow_users = TowUser.create(params[:tow_user])

    if @tow_users.save
      session[:user_id] = @tow_users.id
      redirect_to_home_page
    else
      @errors = @tow_users.errors
      erb :'tow_users/new'
    end
  end

  get '/login' do
    if logged_in?
      @tow_user = current_user
      erb :'tow_users/show'
    else
      erb :'tow_users/login'
    end
  end

  post '/login' do
    @tow_user = TowUser.find_by(email: params[:email])
    if @tow_user && @tow_user.authenticate(params[:password])
      session[:user_id] = @tow_user.id
      redirect_to_home_page
    else
      @errors = 'Username or password does not match.'
      redirect_if_not_logged_in
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to "/"
    else
      redirect_if_not_logged_in
    end
  end

  get '/tow_users/:id/edit' do
    if logged_in?
      @tow_user = TowUser.find(params[:id])
      erb :'tow_users/edit'
    else
      redirect_if_not_logged_in
    end
  end

  patch '/tow_users/:id' do
    @tow_user = TowUser.find(params[:id])
    @tow_user.update(params[:tow_user])

    if @tow_user
      redirect to "/tow_users/#{@tow_user.id}"
    else
      redirect to "/tow_users/#{params[:id]}/edit"
    end
  end

  get '/tow_users/:id' do
    @tow_user = TowUser.find(params[:id])

    if logged_in?
      erb :'tow_users/show'
    else
      redirect_if_not_logged_in
    end
  end

  delete '/tow_users/:id/destroy' do
    if logged_in?
      current_user.delete
      redirect to '/logout'
    else
      redirect_if_not_logged_in
    end
  end

  get '/tow_users' do
    @tow_users = TowUser.all
    erb :'tow_users/index'
  end
end