# frozen_string_literal: true

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  has_many :meetings, dependent: :destroy
  field :user_name, type: String
  field :password_digest, type: String

  validates :user_name, presence: true, uniqueness: true
  has_secure_password
end
