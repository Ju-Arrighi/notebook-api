class PhonesController < ApplicationController
  before_action :set_phones, only: %i[ show ]

  # GET /phone/1
  def show
    render json: @phones #include: [:phones, :kind, :address]
  end

  private

  def set_phones
    if params[:contact_id]
    @phones = Contact.find(params[:contact_id]).phones
    # binding.break
    return @phones
    end
    @phones = phones.where(id: params[:id])
  end

  # def phones_params
  #   params.require(:phone).permit(:number)
  # end
end
