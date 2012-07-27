class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :username
	attr_accessor :password
  has_and_belongs_to_many :albums
	before_save :encrypt_password
	validates_confirmation_of :password, :on => :create, :message => "Password can't be blank"
	validates :email, :presence => true, :uniqueness => {:message => "E-mail already exists."}
	validates :username, :presence => true, :uniqueness => {:message => "Username already exists."}

	def self.authenticate(username, password)
		user = find_by_username(username)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end
	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end	
	end
end
