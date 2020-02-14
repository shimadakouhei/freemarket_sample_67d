class ProductsController < ApplicationController
  require 'payjp'
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
    product = Product.find(params[:id])
    if product.update(product_params)
      flash[:notice] = "編集しました。"
      redirect_to
    else
      flash[:notice] = "必須項目が空欄です。"
      redirect_to edit_product_path(product.id)
    end

  def destroy
    if @product.user_id = current_user.id && @product.destroy
      flash[:notice] = "削除しました。"
    else
      flash[:notice] = "削除失敗しました。"
    end
    redirect_to  root_path
  end
  
  
  def show
    @images = @product.images
  end
  
  def purchase 
  end

    def pay
      @product = Product.find_by(params[:id])
      card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
        amount: @product.price,
        customer: card.customer_id,
        currency: 'jpy',
        )
        
        redirect_to controller: "top", action: 'index'
      end
      
      
      
      private
      
      def product_params
        params.require(:product).permit(:name, :conditions, :delivery_charge, :prefecture, :delivery_day, :text, :user_id, :category_id, :brand_id, :price, images_attributes:  [:src, :_destroy, :product_id]).merge(user_id: current_user.id)
      end
      
    def set_product
      @product = Product.find(params[:id])
    end
  end
  