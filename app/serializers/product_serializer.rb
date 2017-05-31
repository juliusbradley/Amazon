class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :description

  has_many :reviews


end
