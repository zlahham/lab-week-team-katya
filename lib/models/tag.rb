class Tag
  include DataMapper::Resource

  property :id, Serial
  property :tag_name, String
  belongs_to :user
  has n, :tasks, through: Resource
end
