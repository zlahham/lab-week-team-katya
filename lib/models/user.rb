class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  validates_presence_of :email
  validates_confirmation_of :password
  validates_uniqueness_of :email

  property :id, Serial
  property :email, String, required: true
  property :password_digest, Text
  property :password_token, Text
end
