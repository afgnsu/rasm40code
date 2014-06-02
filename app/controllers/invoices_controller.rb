class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:edit, :update, :destroy]

  def show
    # we'll integrate the Invoice details in the Show Purchase screen
    redirect_to purchase_path(params[:purchase_id])
  end

  def new
    @purchase = Purchase.find(params[:purchase_id])
    @invoice = @purchase.build_invoice
  end

  def edit
  end

  def create
    @purchase = Purchase.find(params[:purchase_id])
    @invoice = @purchase.build_invoice(invoice_params)
    if @invoice.save
      redirect_to @purchase, notice: 'Invoice was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @invoice.update_attributes(invoice_params)
      redirect_to @purchase, notice: 'Invoice was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @invoice.destroy
    redirect_to @purchase, notice: 'Invoice was successfully deleted.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @purchase = Purchase.find(params[:purchase_id])
      @invoice = @purchase.invoice
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:reference_number)
    end
end
