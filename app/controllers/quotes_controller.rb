class QuotesController < ApplicationController
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