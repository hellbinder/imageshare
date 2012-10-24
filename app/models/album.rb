class Album < ActiveRecord::Base
  attr_accessible :description, :title, :owner
    cattr_accessor :current_user
	has_many :images, :dependent => :delete_all
	has_and_belongs_to_many :users
	has_one :owner, :class_name => 'User', :foreign_key => 'id', :primary_key => 'user_id'
end
