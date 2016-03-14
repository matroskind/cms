class HomeController < ApplicationController
  def show
  	@pages = Page.all
  end
end
