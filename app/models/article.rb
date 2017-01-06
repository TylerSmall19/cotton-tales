class Article < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :revisions

  validates :title, presence: true, uniqueness: true
  validates :author, presence: true

  def categories=(category_ids)
    category_ids.each do |category_id|
      self.categories << Category.find_by(id: category_id)
    end
  end

  def shorten
  	body[0...50] + '...'
  end

  def update_article
    if self.revisions.any?
      self.body = self.revisions.last
    end
    self
  end
end
