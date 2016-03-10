class CrawlersController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def upsert
    if params[:id]
      crawler = Crawler.find(params[:id])
    end
    if crawler.nil?
      crawler = Crawler.new
    end
		crawler.name = params[:name]
		crawler.test_list_url = params[:test_list_url]
		crawler.test_item_url = params[:test_item_url]
		crawler.list_url_pattern = params[:list_url_pattern]
		crawler.item_url_pattern = params[:item_url_pattern]
		crawler.save
		render json:crawler
	end

  def create
    upsert
  end

  def destroy
    if params[:id]
      crawler = Crawler.find(params[:id])
      crawler.delete
    end
  end

  def update
    upsert
  end

	def index
    render json:Crawler.all
	end

	def show
		render json:Crawler.find(params[:id])
	end

end
