class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @item = Item.new
    @categories = Category.get_all_categories
    @statuses = Status.get_all_statuses
    @units = Unit.get_all_units
    # @item_search = Item.find(params[:id])
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @units = Unit.get_all_units
    @categories = Category.get_all_categories
    @statuses = Status.get_all_statuses
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @categories = Category.get_all_categories
    @statuses = Status.get_all_statuses
    @units = Unit.get_all_units

    name = @item.name.to_i(2)

    #improve item code generation

    @item.code = "I_00" + name.to_s(2)

    if @item.stock < @item.critical_quantity_basis && @item.stock <= 0
      flash[:notice] = "Stocks must be greater than critical quantity basis"
    elsif @item.stock > @item.critical_quantity_basis
      @item.status_id = 1
    elsif @item.stock > 0 || @item.stock < @item.critical_quantity_basis
      @item.status_id = 2
    elsif @item.stock == 0
      @item.status_id = 3
    end

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: 'Item was successfully created.' }
        format.json { render :index, status: :created, location: @item }
      else
        format.html { redirect_to items_path }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_path, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :code, :category_id, :retail_price, :cost_price, :stock, :status_id, :unit_id, :critical_quantity_basis)
    end
end
