class NewsController < ApplicationController
	skip_before_filter  :verify_authenticity_token
  def index
  	@all_news = News.all
  end
  def sports
  	@all_news = News.select("*").where(:category => "sports")
  	render "index"
  	#redirect_to :action => :'index'
  end
  def business
  	@all_news = News.select("*").where(:category => "business")
  	render "index"
  end
  def technology
  	@all_news = News.select("*").where(:category => "tech")
  	render "index"
  end

  def create
  	News.new(:category => params[:category], :title => params[:title], :content => params[:content], :url => params[:url]).save
	redirect_to :action => :'index'
  end

end
