class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'users/show'
  end

  # # GET: /users
  # get '/users' do
  #   erb :'/users/index'
  # end
  #
  # # GET: /users/new
  # get '/users/new' do
  #   erb :'/users/new'
  # end
  #
  # # POST: /users
  # post '/users' do
  #   redirect '/users'
  # end
  #
  # # GET: /users/5
  # get '/users/:id' do
  #   @users = User.all
  #
  #   erb :'/users/show'
  # end
  #
  # # GET: /users/5/edit
  # get '/users/:id/edit' do
  #   erb :'/users/edit'
  # end
  #
  # # PATCH: /users/5
  # patch '/users/:id' do
  #   redirect '/users/:id'
  # end
  #
  # # DELETE: /users/5/delete
  # delete '/users/:id/delete' do
  #   redirect '/users'
  # end
end
