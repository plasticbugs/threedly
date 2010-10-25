class Game < ActiveRecord::Base
  has_many :quotes, :as => :quotable
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
