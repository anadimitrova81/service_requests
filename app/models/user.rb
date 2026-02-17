class User < ApplicationRecord
  has_secure_password

  ROLES = %w[admin courier operator coordinator].freeze

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, presence: true, inclusion: { in: ROLES }

  ROLES.each { |role| define_method(:"#{role}?") { self.role == role } }
end
