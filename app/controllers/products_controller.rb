class ProductsController < ApplicationController

  def index
    @products = Products.all
    render :index  
  end

  def new
    @products = Product.new
    render :new  
  end

  def create
    @products = Products.new(products_params)
    if @products.save
      redirect_to products_path
    else
      render :new
    end  
  end

  def edit
    @products = Products.find(params[:id])
    render :edit
  end

  def show
    @products = Products.find(params[:id])
    render :show  end

  def update
    @products= Products.find(params[:id])      
    if @products.update(products_params)
      redirect_to products_path
    else
     render :edit
    end
  end

  def destroy
    @products = Products.find(params[:id])
    @products.destroy
    redirect_to products_path  end

  private
    def products_params
      params.require(:products).permit(:name, :cost, :country_of_origin)
    end
end