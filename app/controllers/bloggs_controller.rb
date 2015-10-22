class BloggsController < ApplicationController

	before_filter :check_privileges!, only: [:new, :create, :edit, :update, :destroy]
	def index
		if user_signed_in?
			@blogs=Blogg.where(user_id: current_user.id, blog_type: 'Sports')
		else
			@blogs=Blogg.where(blog_type: 'Sports')
		end
	end
	
	def new
		@blogs=Blogg.new
	end
	def create
		@blogs=Blogg.new(blog_params)
		@blogs.user_id=current_user.id
		respond_to do |format|
			if @blogs.save
				
				format.html {redirect_to bloggs_path, notice: 'Your post has been sent for approval'}
			else
				format.html {redirect_to bloggs_path, notice: 'something went wrong'}
			end
		end
	end
	def show
		@blogs = Blogg.find(params[:id])
	end
	def edit
		@blogs = Blogg.find(params[:id])
	end
	def update		
		@blogs = Blogg.find(params[:id])
		if @blogs.update(params[:blogg].permit(:name, :content, :blog_type))
			redirect_to bloggs_path, :notice => "Your blogs was updated"
		else
			render "edit"
		end
	end
	def destroy
		@blogs = Blogg.find(params[:id])
		@blogs.destroy
		redirect_to bloggs_path, :notice => "Your blogs was deleted"
	end

	private
	def blog_params
		params.require(:blogg).permit(:name, :content, :blog_type)
	end

end