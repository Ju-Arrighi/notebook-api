class AddressesController < ApplicationController
  before_action :set_address
  # GET /phone/1
  def show
    render json: @address #include: [:phones, :kind, :address]
  end

  private

  def set_address
    @address = Contact.find(params[:contact_id]).address
     # binding.break
  end
end
