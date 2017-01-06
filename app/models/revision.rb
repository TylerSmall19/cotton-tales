class Revision < ActiveRecord::Base
  belongs_to :article
  belongs_to :author, class_name: "User"

  validates :body, presence: true
  validates :author, presence: true
  before_validation :set_guest

  private
    def set_guest
      if self.author.nil?
        self.author = User.create(username: generate_user, password: "password")
      end
    end

    def generate_user
      "Guest-" + SecureRandom.hex(3)
    end
end
