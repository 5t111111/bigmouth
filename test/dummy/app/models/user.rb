class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :articles, class_name: "Bigmouth::Article", foreign_key: "user_id"
  has_many :files, class_name: "Bigmouth::File", foreign_key: "user_id"

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
end
