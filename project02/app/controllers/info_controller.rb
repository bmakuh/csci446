class InfoController < ApplicationController
  def who_bought
    @product = Product.find(params[:id])
    @orders = @product.orders
    respond_to do |format|
      format.atom {render :layout => false}
      format.json {render :layout => false, :json => @product.to_json(:include => :orders)}
      format.html
    end
  end
  
  protected
  def authorize
  end

end
