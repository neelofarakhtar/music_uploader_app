class MusicsController < ApplicationController
	def index
	if params[:search].present?
  @musics =Music.search(params[:search]).order("created_at DESC")
  @musics =Music.search_all(params[:search]).order("created_at DESC")
   else
    @musics =Music.all.order("created_at DESC")
  end
	end

	def new
		@music =Music.new
	end
	def create
		@music = Music.new(music_params)

    respond_to do |format|
      if @music.save
        format.html { redirect_to musics_url(@music), notice: "Song was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
	end

	def show
    @music = Music.find(params[:id])
  end

  def edit
   @music = Music.find(params[:id])
  end

  def update
  	# debugger
   @music = Music.find(params[:id])
    if @music.update(music_params)
      redirect_to musics_url, notice: "Music was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

   def destroy
   	@music = Music.find(params[:id])
    @music.destroy
	 respond_to do |format|
      format.html { redirect_to musics_url, notice: "Music Data was successfully destroyed." }
    end
  end

	private
	def music_params
		params.require(:music).permit(:artist_name,:composer,:song_file, :search_by_rate)
	end
end
