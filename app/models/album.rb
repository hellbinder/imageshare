class Album < ActiveRecord::Base
  attr_accessible :description, :title
	has_many :images, :dependent => :delete_all
	has_and_belongs_to_many :users
end
