class ProductsController < ApplicationController

  def index
    @products = Product.all
    render :index  
  end

  def new
    @product = Product.new
    render :new  
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      render :new
    end  
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show  
  end

  def update
    @product= Product.find(params[:id])      
    if @product.update(products_params)
      redirect_to products_path
    else
     render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path  
  end

  def home
    @products = Product.all
    @three_most_recent = Product.three_most_recent
    @usa_product = Product.from_usa
    @most_reviewed = Product.most_reviewed
    render :home
  end

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end
end