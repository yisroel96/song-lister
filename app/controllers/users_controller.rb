class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    @user = User.new(params)

    if @user.save
        session[:user_id] = @user.id
      redirect '/songs'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    #make sure email exists in db
    user = User.find_by(username:params[:username])
    #check if password is valid
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/songs"
    else
        redirect "/login"
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/users/:id/edit' do
    @user = User.find_by_id(params[:id])
    if @user
      erb :'users/edit'
    else
      redirect to "/users/:id"
    end
  end

  get '/users/:id' do
    redirect to '/songs'
  end

  patch '/users/:id' do
      @user = User.find_by_id(params[:id])
      if @user && @user.authenticate(params[:user][:password])
        # binding.pry
        @user.username = params[:username]
        @user.email = params[:email]
        @user.save
        redirect to "/users/#{@user.id}"
      else
        redirect to "/users/#{@user.id}/edit"
      end
    end

  #destroys a user
  delete '/users/:id' do
    # binding.pry
    @user = User.find_by_id(params[:id])
    @user.delete
    redirect to '/'
  end

# make sign up page

# make login page DONE!

# redirect when necessary (when user isnt logged in take them to login, same for sign up )


# make song routes secure (make sure only the user that made them can edit/delete)
# if user logged_in etc. DONE!


end
