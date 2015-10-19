class SportsController < ApplicationController
	before_filter :check_privileges!, only: [:new, :create, :edit, :update, :destroy]
	def index
		if user_signed_in?
			
			@sports=Sport.where(user_id: current_user.id, blog_type: 'sports')
		else
			@sports=Sport.where(blog_type: 'sports')
		end
	end
	
	def new
		@sports=Sport.new
	end
	def create
		@sports=Sport.new(params[:sport ].permit(:name, :content, :blog_type))
		@sports.user_id=current_user.id
		respond_to do |format|
			if @sports.save
				
				format.html {redirect_to sports_path, notice: 'Your post has been sent for approval'}
			else
				format.html {redirect_to sports_path, notice: 'something went wrong'}
			end
		end
	end
	def show
		@sports = Sport.find(params[:id])
	end
	def edit
		@sports = Sport.find(params[:id])
	end
	def update
		binding.pry
		
		@sports = Sport.find(params[:id])
		if @sports.update(params[:sport].permit(:name, :content, :blog_type))
			redirect_to sports_path, :notice => "Your sports was updated"
		else
			render "edit"
		end
	end
	def destroy
		@sports = Sport.find(params[:id])
		@sports.destroy
		redirect_to sports_path, :notice => "Your sports was deleted"
	end
end
 