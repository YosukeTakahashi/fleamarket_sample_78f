class AddressesController < ApplicationController
  before_action :set_address, except: [:index, :new, :create]
  def index #詳細のようなページ作成
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      flash[:notice] = "登録が確認できました"
      # 通知機能は下のファイルにて実装
      # app/views/layouts/application.html.haml
      # app/config/locales/ja.yml
      redirect_to root_path
    else    
      flash.now[:alert] = "登録できません"
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

private

  def address_params
    params.require(:address).permit(:postal_code, 
                                    :prefecture, 
                                    :city, 
                                    :house_number,
                                    :room_number,
                                    :telephone_number,
                                    ).merge(user_id: current_user.id)
                                    # mergeでcurrent_user.idの方が出品をした際に、addressテーブルにあるuser_id:カラムと出品物の外部キーでの連携ができる。
  end

  def set_address
    @address = Address.find_by(user_id: current_user.id)
  end

end
