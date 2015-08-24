class User

include DataMapper::Resource

attr_reader :passowrd
attr_accessor :passowrd_confirmation

include DataMapper::Resource

validates_presence_of :email
validates_confirmation _of :passowrd
validates_uniqueness_of :email

property :id, Serial
property :email, String, required: true
property :passowrd_digest, Text
property :passowrd_toeken, Text

end