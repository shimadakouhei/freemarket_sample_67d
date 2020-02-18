class ProductsController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!, only: [:purchase,:new]
  before_action :set_product, except: [:index, :new, :create, :update]
  
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
      redirect_to root_path, notice: 'Event was successfully created.'
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
  end

  def destroy
    if  @product.destroy
      flash[:notice] = "削除しました。"
    else
      flash[:notice] = "削除失敗しました。"
    end
    redirect_to  root_path
  end
  
  
  def show
    @images = @product.images
    @user = User.find_by(params[:id])
  end
  
  def purchase 
    card = Card.where(user_id: current_user.id).first
    # @product = Product.find_by(id:params[:id])
    @address = Address.find_by(params[:id])
    @user = User.find_by(params[:id])
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "cards", action: "new"
      flash[:notice] = '購入にはクレジットカード登録が必要です'
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
    end
  end

  def pay
      card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      charge = Payjp::Charge.create(
        amount: @product.price,
        customer: card.customer_id,
        currency: 'jpy',
      )
      @product.update( buyer_id: current_user.id)
      flash[:notice] = '購入しました。'
      redirect_to  action: 'index'
  end
      
      
      
  private
  
  def product_params
    params.require(:product).permit(:name, :conditions, :delivery_charge, :prefecture, :delivery_day, :text, :user_id, :category_id, :brand_id, :price, images_attributes:  [:src, :_destroy, :product_id]).merge(user_id: current_user.id)
  end
      
  def set_product
    @product = Product.find(params[:id])
  end

end

 
    

    
