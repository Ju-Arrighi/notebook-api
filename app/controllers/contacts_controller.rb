class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show update destroy ]

  # GET /contacts
  def index
    @contacts = Contact.all

    render json: @contacts,  include: [:phones, :kind, :address]
    # render json: @contacts, root: true
    # render json: @contacts, only: [:name, :email]
    # render json: @contacts.map { |contact| contact.attributes.merge(author: "Juliana") }
    # render json: @contacts, methods: :author
  end

  # GET /contacts/1
  def show
    render json: @contact, include: [:phones, :kind, :address]
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, include: [:kind, :phones, :address], location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact, include: [:kind, :phones, :address]
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(
      :name, :email, :birthdate, :kind_id,
      phones_attributes: [:number, :id, :_destroy],
      address_attributes: [:street, :city, :id]
    )
  end
end