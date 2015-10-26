class DateSearchController < ApplicationController
  def index
    sorted_article_dates = Article.pluck(:created_at).sort{|x, y| x <=> y}
    first_year = sorted_article_dates.first.year
    @month_names = {
      1 => "January",
      2 => "February",
      3 => "March",
      4 => "April",
      5 => "May",
      6 => "June",
      7 => "July",
      8 => "August",
      9 => "September",
      10 => "October",
      11 => "November",
      12 => "December"
    }

    @years_hash = Hash.new
    first_year.upto(Time.now.year) do |year|
      h = {1 => false, 2 => false, 3 => false, 4 => false, 5 => false, 6 => false, 7 => false, 8 => false, 9 => false, 10 => false, 11 => false, 12 => false}
      @years_hash[year] = h
    end

    years_months = sorted_article_dates.map{|x| [x.year, x.month]}.uniq
    years_months.each do |pair|
      @years_hash[pair[0]][pair[1]] = true
    end
  end

  def show
    m = params[:id].match(/([0-9]{4})\-([0-9]{2})/)
    @year = m[1]
    @month = m[2]

    @articles = Article.where("created_at LIKE '#{params[:id]}%'")
  end
end
