class Article < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :revisions

  validates :title, presence: true, uniqueness: true
  validates :author, presence: true

  def shorten
  	body[0...50] + '...'
  end
end
