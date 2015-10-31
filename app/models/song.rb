class Song < ActiveRecord::Base
  belongs_to :album

  validates :name, uniqueness: {scope: :album}
end
