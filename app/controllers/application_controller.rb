class ApplicationController < ActionController::Base
  before_filter :get_page_nav, :get_jumbotron, :get_blocks
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_page_nav
  	@page_nav = Page.all
  end
  def get_jumbotron
  	@jumbotron = Block.where("position = 'jumbotron'")
  end
  def get_blocks
  	@blocks = Block.where("position = 'block'").order(order: :asc)
  end
end
