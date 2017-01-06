class Revision < ActiveRecord::Base
  belongs_to :article
  belongs_to :author, class_name: "User"

  validates :body, presence: true
  validates :author, presence: true

  def set_author
    self.author = User.create(username: generate_user, password: generate_password)
  end

  private
    def generate_user
      "Guest-" + SecureRandom.hex(3)
    end

    def generate_password
      SecureRandom.hex(10)
    end
end
