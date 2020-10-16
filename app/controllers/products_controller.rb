class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    @products = Product.all
    @product = Product.new
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def result
    @pr_id = params[:product][:id]
    @name = params[:product][:name]
    @unit = params[:product][:unit]
    @count = params[:count].to_f()
    @total_price = params[:product][:price].to_f() * params[:count].to_f()
    Rails.logger.info @total_price

    respond_to do |format|
        format.js {render 'result'}
    end
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
        format.js
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
   
    def set_product
      @product = Product.find(params[:id])
    end

    
    def product_params
      params.require(:product).permit(:name, :price, :unit)
    end
end
