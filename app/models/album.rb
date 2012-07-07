class Album < ActiveRecord::Base
  attr_accessible :description, :title
	has_many :images, :dependent => :delete_all
end
