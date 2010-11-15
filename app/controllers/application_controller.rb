class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from Amazon::AWS::Error::NoExactMatches, :with => :record_not_found
  
  def record_not_found
    flash[:error] = "No Amazon Listing Found"
    redirect_to :back
  end
  
end
