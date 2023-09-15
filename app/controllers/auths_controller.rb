class AuthsController < ApplicationController
  def create
    hmac_secret = 'my$ecretK3y'
    exp = Time.now.to_i + 30
    payload = { name: params[:name], exp: exp }
    # exp_payload = { data: 'data', exp: exp }
    token = JWT.encode payload, hmac_secret, 'HS256'
    render json: { token: token }
  end
end
