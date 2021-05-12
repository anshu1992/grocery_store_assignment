module AuthorizeAdmin
  extend ActiveSupport::Concern

  included do
    before_action :authorize_admin, except: [:show]
  end

  private

  def authorize_admin
    return if current_admin_user.present?
    redirect_to root_path, alert: 'You are not authorized!'
  end
end
