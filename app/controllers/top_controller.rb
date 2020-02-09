class TopController < ApplicationController
  def index

  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
  end




  

  def show
    
  end  
  
end

private

def product_params
  params.require(:products).permit(:name, :conditions, :delivery_charge, :prefecture, :delivery_day, :text, :user_id, :category_id, :brand_id, :price)
end
