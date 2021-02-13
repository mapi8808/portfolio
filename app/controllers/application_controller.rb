class ApplicationController < ActionController::Base
  # 登録時の登録情報追加（deviseのデフォルトはメール、パス）
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
# ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可される
# admin_flagを追加して、記録を残すようにした。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :admin_flag])
  end
end
