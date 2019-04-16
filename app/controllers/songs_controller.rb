class SongsController < ApplicationController

  get '/songs' do #loads index page
    @songs = Song.all
    erb :'songs/index'
  end
  
  get '/songs/new' do #loads new form
    erb :new
  end

  post '/songs' do  #creates a song
    @song = Song.create(params)
    redirect to "/songs/#{@song.id}"
  end

  get '/songs/:id' do  #loads show page
    @song = Song.find_by_id(params[:id])
    erb :'songs/show'
  end

  get '/songs/:id/edit' do #loads edit form
    @song = Song.find_by_id(params[:id])
    erb :'songs/edit'
  end

  patch '/songs/:id' do  #updates a song
    binding.pry
    @song = Song.find_by_id(params[:id])
    @song.title = params[:title]
    @song.artist = params[:artist]
    @song.genre = params[:genre]
    @song.save
    redirect to "/songs/#{@song.id}"
  end

  delete '/songs/:id' do #destroy action
    binding.pry
    @song = Song.find_by_id(params[:id])
    @song.delete
    redirect to '/songs'
  end

end

#   # GET: /songs
#   get '/songs' do
#     @songs =  Song.all
#     erb :'/songs/index'
#   end
#
#   # GET: /songs/new
#   get '/songs/new' do
#     @song = Song.create(params [:title] [:artist][:artist][:genre])
#     erb :'/songs/new'
#   end
#
#   # POST: /songs
#   post '/songs' do
#     redirect '/songs'
#   end
#
#   # GET: /songs/5
#   get '/songs/:id' do
#     erb :'/songs/show'
#   end
#
#   # GET: /songs/5/edit
#   get '/songs/:id/edit' do
#     erb :'/songs/edit'
#   end
#
#   # PATCH: /songs/5
#   patch '/songs/:id' do
#     redirect '/songs/:id'
#   end
#
#   # DELETE: /songs/5/delete
#   delete '/songs/:id/delete' do
#     redirect '/songs'
#   end
# end
