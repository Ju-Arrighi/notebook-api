class KindsController < ApplicationController
  # include ActionController::HttpAuthentication::Basic::ControllerMethods
  # http_basic_authenticate_with name: 'juliana', password: 'secret', except: [:index]
  # TOKEN = 'secret123'
  # include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate_user!
  before_action :set_kind, only: %i[show update destroy]

  # GET /kinds
  def index
    @kinds = Kind.all

    render json: @kinds
  end

  # GET /kinds/1
  def show
    render json: @kind
  end

  # POST /kinds
  def create
    @kind = Kind.new(kind_params)

    if @kind.save
      render json: @kind, status: :created, location: @kind
    else
      render json: @kind.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kinds/1
  def update
    if @kind.update(kind_params)
      render json: @kind
    else
      render json: @kind.errors, status: :unprocessable_entity
    end
  end

  # DELETE /kinds/1
  def destroy
    @kind.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_kind
    if params[:contact_id]
      kind_id = Contact.find(params[:contact_id]).kind_id
    else
      kind_id = Kind.find(params[:id]).id
    end
    @kind = Kind.find(kind_id)
  end

  # Only allow a list of trusted parameters through.
  def kind_params
    params.require(:kind).permit(:description)
  end

  # def authenticate
  #   authenticate_or_request_with_http_token do |token, options|
  #     hmac_secret = 'my$ecretK3y'
  #     JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }
  #     # Compare tokens in a time constant manner to avoid timing attack
  #     # ActiveSupport::SecurityUtils.secure_compare(
  #     #   ::Digest::SHA256.hexdigest(token),
  #     #   ::Digest::SHA256.hexdigest(TOKEN)
  #     # )
  #   end
  # end
end
