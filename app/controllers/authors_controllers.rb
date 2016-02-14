class BooksController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def create
		logger.debug(params[:book])
		logger.debug(params[:author])
		author = Author.find_by(name: params[:author])
		if !author
			author = Author.new
			author.name = params[:author]
			author.save
		end
		book = Book.new
		book.name = params[:book][:name]
		book.author_id = author[:id]
		book.save
		render json:book
	end

	def index
		render json:Book.all
	end

end
