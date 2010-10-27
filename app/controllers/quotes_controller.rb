class QuotesController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index]
  
  def index
    @quotable = find_quotable
    @quotes = @quotable.quotes
  end

  def create
    @quotable = find_quotable
    @quote = @quotable.quotes.build(params[:quote])
    if @quote.save
      flash[:notice] = "Successfully created quote."
      redirect_to :id => nil
    else
      render :action => 'new'
    end
  end
  
  def edit
    @quotable = find_quotable
    @quote = @quotable.quotes.find(params[:id])
  end
  
  def update
    @quotable = find_quotable
    @quote = @quotable.quotes.find(params[:id])
        
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
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end