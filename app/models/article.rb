require 'nokogiri'

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
  	snippet = Nokogiri::HTML::Document.parse(body)
    text = snippet.css('p').map(&:text).pop
    text[0..50] + "..."
  end

  def thumbnail
  	snippet = Nokogiri::HTML::Document.parse(body)
  	img_url = snippet.css('img').attr('src')
  	return nil if img_url == nil
  	img_url.value
  end

  def update_article
    if self.revisions.any?
      self.body = self.revisions.last
    end
    self
  end

 
  def is_thumbnail?
  	self.body.include?("img")
  end
end
