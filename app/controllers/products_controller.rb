class ProductsController < ApplicationController

  def index
    @products = Product.all
    render :index  
  end

  def new
    @products = Product.new
    render :new  
  end

  def create
    @products = Product.new(products_params)
    if @products.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      render :new
    end  
  end

  def edit
    @products = Product.find(params[:id])
    render :edit
  end

  def show
    @products = Product.find(params[:id])
    render :show  end

  def update
    @products= Product.find(params[:id])      
    if @products.update(products_params)
      redirect_to products_path
    else
     render :edit
    end
  end

  def destroy
    @products = Product.find(params[:id])
    @products.destroy
    redirect_to products_path  end

  def home
    @products = Product.all@three_most_recent = Product.three_most_recent
    @usa_product = Product.usa_prodcut
    @most_reviewed = Product.most_reviewed
    render :home
  end

  private
    def products_params
      params.require(:products).permit(:name, :cost, :country_of_origin)
    end
end