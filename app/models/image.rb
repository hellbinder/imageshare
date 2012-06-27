class Image < ActiveRecord::Base
  has_attached_file :image_file, :styles => { 
    :medium => "300x300>", 
    :thumb => "100x100>" }

  attr_accessible :description, :name, :image_file


end
