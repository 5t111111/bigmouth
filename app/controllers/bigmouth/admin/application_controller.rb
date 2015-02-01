class Bigmouth::Admin::ApplicationController < ApplicationController
  def action_requires_login
    if current_user.blank?
      redirect_back_or_to Bigmouth.config.sign_in_uri[:uri],
                          alert: "You are not permitted to do this action."
    end
  end
end
