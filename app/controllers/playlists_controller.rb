class PlaylistsController < ApplicationController
   before_action :find_music, only: [:create, :show]

  def create
   @playlist = @music.playlist.create(user_id: current_user.id)
    redirect_to music_playlist_path(@music,@playlist)
  end

  def show
    # debugger
     @playlist = @music.playlist.find(params[:id])
     
  end
  private
  def find_music
    @music =Music.find(params[:music_id])
  end

end
