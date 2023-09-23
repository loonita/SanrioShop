class ProductsController < ApplicationController
  def index
    @products = Product.all.with_attached_photo
  end
  def show
    product
  end

  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    pp @product

    if @product.save
      redirect_to products_path, notice: 'Product successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    product
  end
  def update

    if product.update(product_params)
      redirect_to products_path, notice: 'Product successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
   
    product.destroy

    redirect_to products_path, notice: 'Product successfully deleted', status: :see_other
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price, :photo)
  end
  def product
    @product ||= Product.find(params[:id])
  end
end

