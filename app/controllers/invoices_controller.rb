class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
    render json: @invoices
  end

  def show
    @invoice = Invoice.find(params[:id])
    render json: @invoice
  end

  def create
    @invoice = Invoice.create(
      date: params[:date],
      due_date: params[:due_date],
      consecutive: params[:consecutive],
      discount_amount: params[:discount_amount],
      terms: params[:terms],
      footer: params[:footer],
      subtotal: params[:subtotal],
      total: params[:total],
      customer_id: params[:customer_id]
    )
    render json: @invoice
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update(
      date: params[:date],
      due_date: params[:due_date],
      consecutive: params[:consecutive],
      discount_amount: params[:discount_amount],
      terms: params[:terms],
      footer: params[:footer],
      subtotal: params[:subtotal],
      total: params[:total],
      customer_id: params[:customer_id]
    )
    render json: @invoice
  end

  def destroy
    @invoices = Invoice.all
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    render json: @invoices
  end

end
