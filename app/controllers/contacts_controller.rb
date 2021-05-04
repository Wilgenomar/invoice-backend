class ContactsController < ApplicationController


  def create
    render json: Contact.insert_all(params['_json'])
  end

  def index
    @contacts = Contact.all

    render json: @contacts
  end

  def show
    @contact = Contact.find(params[:id])
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
    @contacts = Contact.all
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: @contacts
  end

end
