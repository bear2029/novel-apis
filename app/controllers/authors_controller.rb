class AuthorsController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def create
    author = Author.new
    author.name = params[:name]
    author.save
    render json:author
  end

	def index
		render json:Author.all
	end

	def show
		render json:Author.find(params[:id])
	end

end
