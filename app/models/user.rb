class User < ActiveRecord::Base
  has_many :articles, foreign_key: :author_id
  has_many :revisions, foreign_key: :author_id

  validates :username, :password_digest, presence: true
  validates :username, uniqueness: true

  has_secure_password

end
