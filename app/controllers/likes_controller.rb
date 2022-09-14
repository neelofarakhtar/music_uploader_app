class LikesController < ApplicationController
	before_action :find_music
	before_action :find_like, only: [:destroy]

  def create
  	if already_liked?
    flash[:notice] = "You can't like more than once"
  else
    @music.likes.create(user_id: current_user.id)
  end
    redirect_to musics_path(@music)
  end

  def destroy
  if !(already_liked?)
    flash[:notice] = "Cannot unlike"
  else
    @like.destroy
  end
  redirect_to musics_path(@music)
end

  private
  def find_music
    @music = Music.find(params[:music_id])
  end

  def already_liked?
  Like.where(user_id: current_user.id, music_id:
  params[:music_id]).exists?
end

  def find_like
   @like = @music.likes.find(params[:id])
end
end
