class TestsController < ApplicationController
  # ウィキペディア
  # 参考 => https://github.com/kenpratt/wikipedia-client
  require 'wikipedia'

  def index
    # @test = Test.all
    if params[:keyword]
      @results = Wikipedia.find(params[:keyword]).summary
    else
      @results = Wikipedia.find(".")
    end
  end

  def game
  end
end
