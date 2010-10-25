class Game < ActiveRecord::Base
  has_many :quotes, :as => :quotable
  has_attached_file :image
end
