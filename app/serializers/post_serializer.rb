class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :text
  belongs_to :author
  has_many :comments
end
