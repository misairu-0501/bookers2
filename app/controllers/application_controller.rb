class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about] #ログインしていない状態でのリダイレクト先をログイン画面に設定(topアクション、aboutアクションは除く)
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Sign up後の遷移先を設定
  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end

  # Sign in後の遷移先を設定
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  # Sign out後の遷移先を設定
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  # ユーザー登録(sign_up)の際に、ユーザー名(name),メールアドレス(email)のデータ操作を許可しています。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

end
