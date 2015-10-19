class MusicController < ApplicationController
	before_filter :check_privileges!, only: [:new, :create, :edit, :update, :destroy]
	def index
		if user_signed_in?
			
			@music=Sport.where(user_id: current_user.id, blog_type: 'music')
		else
			@music=Sport.where(blog_type: 'music')
		end
	end
	
	def new
		@music=Sport.new
	end
	def create
		
		@music=Sport.new(params[:sport ].permit(:name, :content, :blog_type))
		@music.user_id=current_user.id
		respond_to do |format|
			if @music.save
				binding.pry
				
				format.html {redirect_to music_index_path, notice: 'Your post has been sent for approval'}
			else
				format.html {redirect_to music_index_path, notice: 'something went wrong'}
			end
		end
	end
	def show
		@music = Sport.find(params[:id])
	end
	def edit
		binding.pry
		@music = Sport.find(params[:id])
	end
	def update
		binding.pry
		@music = Sport.find(params[:id])
		if @music.update(params[:sport].permit(:name, :content, :blog_type))
			redirect_to music_index_path, :notice => "Your sports was updated"
		else
			render "edit"
		end
	end
	def destroy
		@music = Sport.find(params[:id])
		@music.destroy
		redirect_to music_index_path, :notice => "Your sports was deleted"
	end
end
