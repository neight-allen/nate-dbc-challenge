class Album < ActiveRecord::Base
  belongs_to :artist
  belongs_to :user
  has_many :songs

  validates :name, uniqueness: {scope: :artist}
end
