require 'amazon/aws/search'
require 'cgi'

class Product < ActiveRecord::Base
  has_many :quotes, :as => :quotable
  has_attached_file :image

  def aws_description
    aws_data[:description]
  end
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
  
  def image_url
    aws_data[:image_url]
  end
  
  def amazon_url
    aws_data[:amazon_url]
  end

  def aws_data
    begin
    return @aws_data if @aws_data
    #@aws_data          = Rails.cache.fetch("movies/aws_data/#{self.id}", :expires_in => 3.minutes) do
    is                  = Amazon::AWS.item_search( 'Electronics', 'Title' => title)
    product             = is.item_search_response[0].items[0].item[0]
    if product.medium_image.nil?
      image_url         = product.image_sets.image_set.medium_image.url.to_s 
    else
      image_url         = product.medium_image.url.to_s
    end
    descriptions        = product.editorial_reviews[0].editorial_review.map { |i| i.content[0] }
    description         = CGI::unescapeHTML(descriptions.min { |a,b| a.length <=> b.length }.to_s).gsub(/<\/?[^>]*>/, "")[0,450]
    amazon_url          = product.detail_page_url.to_s
    @aws_data           = { :image_url => image_url, :description => description, :amazon_url => amazon_url }
    rescue
      @aws_data           = { :image_url => '../images/default.png', :description => 'No Amazon data available', :amazon_url => '#'}
    end
  end
end
