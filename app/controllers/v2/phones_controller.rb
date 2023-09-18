module V2
  class PhonesController < ApplicationController
    before_action :set_contact, only: %i[ show update destroy]

    # GET/contacts/:contact_id/phones
    def show
      render json: @phones #include: [:phones, :kind, :address]
    end

    # PUT/contacts/:contact_id/phone
    def create
      @contact.phones << Phone.new(phone_params)
      if @contact.save
        render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
      else
        render json: @contact.phones.errors
      end
    end

    # PATCH/contacts/:contact_id/phone
    def update
      phone = Phone.find(phone_params[:id])
      if phone.update(phone_params)
        render json: @contact.phones
      else
        render json: @contact.phones.errors
      end
    end

    # DELETE/contacts/:contact_id/phone
    def destroy
      phone = Phone.find(phone_params[:id])
      phone.destroy
    end

    private

    def set_contact
      @contact = Contact.find(params[:contact_id])
    end

    def phone_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
  end
end
