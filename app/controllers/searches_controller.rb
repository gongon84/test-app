class SearchesController < ApplicationController
  # ウィキペディア
  # 参考 => https://github.com/kenpratt/wikipedia-client
  require 'wikipedia'

  def index
    @results = Search.all
  end

  def create
    text = params[:keyword].split(/\r\n|\r|\n/);
    if text.instance_of?(Array) # 複数の単語
      text.each do |word|
        wiki_search(word)
      end
    else
      wiki_search(text) # 一つの単語
    end
    @results = Search.all
  end

  def good
    @searche = Search.find(params[:id])
    @searche.title = "1"
    if @searche.save
      @results = Search.all
    end
  end

  def destroy
    @searche = Search.find(params[:id])
    @searche.title = "0"
    if @searche.save
      @results = Search.all
    end
  end

  private
  def wiki_search(word)
    if Wikipedia.find(word).summary
        word = Wikipedia.find(word).summary
        @results = Search.new(content: word)
    else
        url = "https://www.google.com/search?q=" + word
        @results = Search.new(url: url)
    end
    @results.save
  end
end
