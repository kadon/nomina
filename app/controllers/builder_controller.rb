class BuilderController < ApplicationController
  respond_to :json

  # post
  def create
    var = Builder.find(1)
    respond_with(var)
  end
end
