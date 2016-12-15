class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:show, :edit, :update, :destroy]

  # GET /deliveries
  # GET /deliveries.json
  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
    @items = Item.get_all_items
  end

  # GET /deliveries/1
  # GET /deliveries/1.json
  def show
  end

  # GET /deliveries/new
  def new
    @delivery = Delivery.new
  end

  # GET /deliveries/1/edit
  def edit
  end

  # POST /deliveries
  # POST /deliveries.json
  def create
    @delivery = Delivery.new(delivery_params)
    @get_item_quantity = params[:delivery][:item_id]
    @item = Item.find(@get_item_quantity)

    @stock_after_delivery = @item.stock + @delivery.quantity

    @delivery.quantity_before_delivery = @item.stock

    @delivery.quantity_after_delivery = @stock_after_delivery

    @item.update_attribute(:stock, @stock_after_delivery)

    if @stock_after_delivery == 0
      @item.update_attribute(:status_id, 3)
    elsif @stock_after_delivery > 0 and @stock_after_delivery < @item.critical_quantity_basis
      @item.update_attribute(:status_id, 2)
    elsif @stock_after_delivery > @item.critical_quantity_basis
      @item.update_attribute(:status_id, 1)
    end

    respond_to do |format|
      if @delivery.save
        format.html { redirect_to delivery_path, notice: 'Delivery was successfully created.' }
        format.json { render :show, status: :created, location: @delivery }
      else
        format.html { render :new }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deliveries/1
  # PATCH/PUT /deliveries/1.json
  def update
    respond_to do |format|
      if @delivery.update(delivery_params)
        format.html { redirect_to @delivery, notice: 'Delivery was successfully updated.' }
        format.json { render :show, status: :ok, location: @delivery }
      else
        format.html { render :edit }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliveries/1
  # DELETE /deliveries/1.json
  def destroy
    @delivery.destroy
    respond_to do |format|
      format.html { redirect_to deliveries_url, notice: 'Delivery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_params
      params.require(:delivery).permit(:item_id, :quantity, :quantity_before_delivery, :quantity_after_delivery)
    end
end
