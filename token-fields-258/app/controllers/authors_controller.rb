class AuthorsController < ApplicationController
  def index
    @authors = Author.order(:name)
    respond_to do |format|
      format.html

                                                # queryParam: q (jQuery Tokeninput API)
      format.json { render json: @authors.tokens(params[:q]) }
    end
  end
end