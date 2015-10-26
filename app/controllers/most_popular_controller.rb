class MostPopularController < ApplicationController
  def index
    @articles = Article.order(views: :desc).limit(3)
  end
end
