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
      chapters = Chapter.where(book_id: params[:book_id])
      chapters = chapters.order(:seq)
    else
      chapters = Chapter.all
      chapters = chapters.order(:id)
    end
    
    if params[:from] && params[:to]
      chapters = chapters.where("seq >= ?",params[:from])
      chapters = chapters.where("seq <= ?",params[:to])
    else
      if params[:page_size]
        page_size = params[:page_size];
      else
        page_size = 20
      end
      if params[:page]
        page = params[:page]
      else
        page = 1
      end
      chapters = chapters.limit(page_size).offset((page-1)*page_size)
    end

    render json:chapters
	end

	def show
    if params[:book_id]
      render json:Chapter.where(book_id: params[:book_id]).find_by(seq: params[:id])
    else
      render json:Chapter.find(params[:id])
    end
	end

end

