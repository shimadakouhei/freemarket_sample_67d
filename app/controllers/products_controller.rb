class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]
  
    def index
      @products = Product.includes(:images).order('created_at DESC')
    end
  
    def new
      @product = Product.new
      @product.images.new
    end
  
    
    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to root_path
      else
        render :new
      end
    end
    
    def edit
      @products = Product.find(params[:id])
    end
    
    def update
      if @product.update(product_params)
        redirect_to root_path
      else
        render :edit
      end
    end
    
    def show
      @product = Product.find(params[:id])
      @images = @product.images
    end
    
    def destroy
    end
    
    private
    
    def product_params
      params.require(:product).permit(:name, :conditions, :delivery_charge, :prefecture, :delivery_day, :text, :user_id, :category_id, :brand_id, :price, images_attributes:  [:src, :_destroy, :product_id]).merge(user_id: current_user.id)
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
