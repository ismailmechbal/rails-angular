class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :category
end