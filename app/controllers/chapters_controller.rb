class ChaptersController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def create
    
    ap params
    return head :not_found unless params[:book_id]
		chapter = Chapter.new
		chapter.title = params[:title]
		chapter.body = params[:body]
		chapter.seq = params[:seq]
		chapter.book_id = params[:book_id]
		chapter.save
		render json:chapter
	end

	def index
    if params[:book_id]
      render json:Chapter.where(book_id: params[:book_id])
    else
      render json:Chapter.all
    end
	end

	def show
		render json:Chapter.where(book_id: params[:book_id]).where(seq: params[:id]).last
	end

end

