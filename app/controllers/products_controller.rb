class ProductsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    @products = Product.find(:all)
  end

  def show
    @product = Product.find(params[:id])
    @quotes = @product.quotes.find(:all)
    @search = Twitter::Search.new.containing(@product.title).lang('en').rpp(10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    
    if @product.save
      flash[:notice] = 'Product was successfully created.'
      redirect_to(@product)
    else
      render :action => "new"
    end
    
  end
  
  def update
    @product = Product.find(params[:id])
    
    if @product.update_attributes(params[:product])
      flash[:notice] = 'Product was successfully updated!'
      redirect_to(@product)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product was successfully deleted."
    
    redirect_to :action => "index"
  end
    

  def edit
    @product = Product.find(params[:id])
  end

end
