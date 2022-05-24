class Api::V1::ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    # skip_before_action :verify_authenticity_token
end
