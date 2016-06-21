class ProductsController < ApplicationController

	before_action :set_product, only: [:edit, :update, :destroy, :remove_image]
	before_action :remember_id, only: [:destroy]
	after_action :remove_id_directory, only: [:destroy]

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  # GET /product/new
  def new
    @product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	@product.save
  	redirect_to products_path
  end

  def update
  	@product.update(product_params)
  	redirect_to products_path
  end


  def destroy
  	@product.destroy
    redirect_to products_path, notice: 'Pet was successfully destroyed.' 
  end


  private

  def remember_id
    @id = @product.id
  end

  def remove_id_directory
    FileUtils.remove_dir("#{Rails.root}/public/uploads/product/image/#{@id}", :force => true)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :price, :active, :description, :image)
  end
end