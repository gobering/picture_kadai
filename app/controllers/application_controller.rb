class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required

  private

  def login_required
    redirect_to new_session_path unless current_user
  end

  def fobid_login_user
    if @current_user
      flash[:notice]="ログインしています"
      redirect_to("/pictuers/index")
    end
  end
  
end
