class SongsController < ApplicationController

  #loads index page
  get '/songs' do
    if logged_in?
        @songs = Song.where(user_id:session[:user_id])
        current_user
        erb :"songs/index"
    else
        redirect '/'
    end
  end

  #loads new form
  get '/songs/new' do
    erb :'songs/new'
  end

  #loads edit form
  get '/songs/:id/edit' do
    @song = Song.find_by_id(params[:id])
    if @song
      erb :'songs/edit'
    else
      redirect '/songs'
    end
  end

  #loads show page
  get '/songs/:id' do
    @song = Song.find_by_id(params[:id])
    if @song
      erb :'songs/show'
    else
      redirect '/songs'
    end
  end

  #creates a song
  post '/songs' do
    @song = Song.new(params)
    @song.user_id = session[:user_id]
    if @song.save
      #current_user.songs << @song
      redirect to "/songs/#{@song.id}"
    else
      redirect '/songs'
    end
  end

  #updates a song
  patch '/songs/:id' do
    # binding.pry
    @song = Song.find_by_id(params[:id])
    @song.title = params[:title]
    @song.artist = params[:artist]
    @song.genre = params[:genre]
    @song.save
    redirect to "/songs/#{@song.id}"
  end

  #destroys a song
  delete '/songs/:id' do
    # binding.pry
    @song = Song.find_by_id(params[:id])
    @song.delete
    redirect to '/songs'
  end

end
