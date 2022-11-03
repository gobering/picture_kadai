class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  # before_action :require_admin
  before_action user_admin, only: [:index]

  def index
    @users = User.all.includes(:tasks)
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path(@user), notice: "ユーザー情報を登録しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザー情報を更新しました"
    else
      redirect_to edit_admin_user_path(@user), notice: "管理者がいなくなるのでダメです"
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: "ユーザー情報を消去しました"
    else
      redirect_to admin_users_path, notice: "管理者がいなくなるのでダメです"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
    

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # def require_admin
  #   unless current_user.admin?
  #     redirect_to tasks_path, notice: "管理者以外はアクセスできない"
  #   end
  # end

  def user_admin
    @users = User.all
    if  current_user.admin == false
        redirect_to tasks_path
    else
        render action: "index"
    end
 end
end
