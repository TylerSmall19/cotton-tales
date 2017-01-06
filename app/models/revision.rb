class Revision < ActiveRecord::Base
  belongs_to :article
  belongs_to :author, class_name: "User"

  validates :body, presence: true
  validates :author, presence: true
  before_validation :set_author

  private
    def set_author
      if self.author.nil?
        self.author = User.create(username: generate_user, password: generate_password)
      end
    end

    def generate_user
      "Guest-" + SecureRandom.hex(3)
    end

    def generate_password
      SecureRandom.hex(10)
    end
end
