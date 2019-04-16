class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'users/show'
  end

# make sign up page
# make login page
# redirect when necessary (when user isnt logged in take them to login, same for sign up )


# make song routes secure (make sure only the user that made them can edit/delete)
# if user logged_in etc.


end
