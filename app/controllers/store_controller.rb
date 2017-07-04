class StoreController < ApplicationController
  #skip_before_action :authorize
  skip_before_action :authenticate_user!
  include CurrentCart
  before_action :set_cart
  def index
    if params[:set_locale]
      redirect_to store_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
  end
end
