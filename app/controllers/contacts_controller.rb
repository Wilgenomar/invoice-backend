class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render json: @contacts
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def create
    @contact = Contact.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone: params[:phone],
      customer_id: params[:customer_id]
    )
    render json: @contact
  end


  def update
    @contact = Contact.find(params[:id])
    @contact.update(
      name: params[:name],
      description: params[:description],
      price: params[:price]
    )
    render json: @contact
  end

  def destroy
    @contacts = Product.all
    @contact = Product.find(params[:id])
    @contact.destroy
    render json: @contacts
  end

end
