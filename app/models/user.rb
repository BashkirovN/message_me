class User < ApplicationRecord
  has_secure_password

  has_many :messages, dependent: :destroy

  validates :username, presence: true,
              uniqueness: { case_sensitive: false }, 
              length: { minimum: 3, maximum: 15 }
  validates :password, presence: true,
              length: { minimum: 6 },
              if: -> { new_record? || !password.nil? }
  validates :password_confirmation, presence: true,
              if: -> { new_record? || !password.nil? }
  validate :passwords_match

  private

  def passwords_match
    errors.add(:password_confirmation, "doesn't match Password") if password != password_confirmation
  end
end
