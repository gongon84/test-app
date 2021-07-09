class TestsController < ApplicationController
  # ウィキペディア
  # 参考 => https://github.com/kenpratt/wikipedia-client
  require 'wikipedia'

  def index
    @test = Test.all
    # if params[:keyword]
    #   @results = Wikipedia.find(params[:keyword])
    # else
    #   @results = Wikipedia.find(".")
    # end

    #  # 日本語版Wikipediaを設定
    #  Wikipedia.configure {
    #   domain 'ja.wikipedia.org'
    #   path   'w/api.php'
    # }
  end

  def create
    if Wikipedia.find(params[:keyword]).summary
      results = Wikipedia.find(params[:keyword]).summary
    else
      # results = Wikipedia.find(".")
      results = "検索失敗"
    end
    @test = Test.new(test_text: results)
    if @test.save
      @test = Test.all
    end
  end
end
