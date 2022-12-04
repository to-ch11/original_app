class BaseController < ApplicationController
  before_action :authenticate_user!

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end