class CardsController < ApplicationController
  require 'payjp'
  # before_action :set_card

  def index
  end
  
  def buy
  end

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end
  
  def pay
    Payjp.api_key = "sk_test_3ec464cbd1eda662724694ba"
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create( # ここで先ほど生成したトークンを顧客情報と紐付け、PAY.JP管理サイトに送信
        description: 'test',
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )

    @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def destroy #PayjpとCardのデータベースを削除
    Payjp.api_key = "sk_test_3ec464cbd1eda662724694ba"
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy #削除に成功した時にポップアップを表示します。
      redirect_to action: "new", notice: "削除しました"
    else #削除に失敗した時にアラートを表示します。
      redirect_to action: "new", alert: "削除できませんでした"
    end
  end



  def show #Cardのデータpayjpに送り情報を取り出します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = "sk_test_3ec464cbd1eda662724694ba"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
  # private

  # def set_card
  # @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  # end
end

  


