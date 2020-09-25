class ItemsController < ApplicationController
  def index
  end
  def new
    @user = User.new
  end

  def create
    # User.create(user_params)

    @user = User.new(user_params)
    # バリデーションで問題があれば、保存はされず「投稿画面」に戻る
    if @user.valid?
      @user.save
      redirect_to root_path
    else
      # 保存されなければ、newに戻る
      render 'new'
    end
  end

end
