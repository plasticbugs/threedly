class QuotesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_filter :find_quotable
  
  def index
    @quotes = @quotable.quotes
  end
  
  def create
    @quote = @quotable.quotes.build(params[:quote])
    if @quote.save
      flash[:notice] = "Successfully created quote."
      redirect_to :id => nil
    else
      render :action => 'new'
    end
  end
  
  def show
    @quote = Quote.find(params[:id])
  end
  
  def new
    @quote = Quote.new
  end
  
  def edit
    @quote = Quote.find(params[:id])
  end
  
  def update
    @quote = Quote.find(params[:id])
        
    if @quote.update_attributes(params[:quote])
      flash[:notice] = 'Quote was successfully updated!'
      redirect_to @quotable
    else
      render :action => 'edit'
    end
  end
  
private
  def find_quotable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @quotable = $1.classify.constantize.find(value)
        return @quotable
      end
    end
    nil
  end


end