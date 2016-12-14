class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
    @sale = Sale.new
    @items = Item.get_all_items
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    @get_item_quantity = params[:sale][:item_id]
    @item = Item.find(@get_item_quantity)
    @sale.total_sale = @sale.quantity * @item.cost_price

    # compute stock after sale
    @stock_after_sale = @item.stock - @sale.quantity

    @sale.quantity_before_sale = @item.stock

    @sale.quantity_after_sale = @stock_after_sale
    #update item's stock
    @item.update_attribute(:stock, @stock_after_sale)

    if @stock_after_sale == 0
      @item.update_attribute(:status_id, 3)
    elsif @stock_after_sale > 0 and @stock_after_sale < @item.critical_quantity_basis
      @item.update_attribute(:status_id, 2)
    elsif @stock_after_sale > @item.critical_quantity_basis
      @item.update_attribute(:status_id, 1)
    end

    respond_to do |format|
      if @sale.save
        format.html { redirect_to sales_path, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:item_id, :quantity, :total_sale)
    end
end
