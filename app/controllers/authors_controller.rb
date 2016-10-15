class AuthorsController < ApplicationController
	before_action :find_author, only: [:show, :edit, :update, :destroy]

	def index
		@authors = Author.all.order("created_at DESC")
	end

def new 
	@author = Author.new 
end

def create
	@author = Author.new(post_params)
	if @author.save
		redirect_to @author
		else
		render new 
	end
end

def show
	#@author = Author.find(params[:id])
end

def edit
	#@author = Author.find(params[:id])
	end

	def update
		#@author = Author.find(params[:id])
		if @author.update(post_params)
			redirect_to @author
		else
			render edit
		end
	end 

	
def destroy
	@author.destroy
	redirect_to @author
	end

private


def find_author
	@author = Author.find(params[:id])
	end

def post_params
	params.require(:author).permit(:name)

    end
end
