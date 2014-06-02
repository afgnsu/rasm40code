class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:edit, :update, :destroy]

  def index
    # integrate with show purchase
    redirect_to Purchase.find(params[:purchase_id])
  end

  def show
    # integrate with show purchase
    redirect_to Purchase.find(params[:purchase_id])
  end

  def new
    @purchase = Purchase.find(params[:purchase_id])
    @line_item = @purchase.line_items.build
  end

  def edit
  end

  def create
    @purchase = Purchase.find(params[:purchase_id])
    @line_item = @purchase.line_items.build(line_item_params)
    if @line_item.save
      redirect_to @purchase, notice: 'Line Item was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @line_item.update_attributes(line_item_params)
      redirect_to @purchase, notice: 'Line Item was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @line_item.destroy
    redirect_to @purchase, notice: 'Line Item was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @purchase = Purchase.find(params[:purchase_id])
      @line_item = @purchase.line_items.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :quantity, :cost)
    end
end