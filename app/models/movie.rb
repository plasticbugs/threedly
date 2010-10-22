class Movie < ActiveRecord::Base
  has_many :quotes, :as => :quotable
end
