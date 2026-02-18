class User < ApplicationRecord
  has_secure_password

  ROLES = %w[admin courier operator coordinator]

  ROLE_ICONS = {
    "admin" => "\u{1F6E1}",
    "courier" => "\u{1F69A}",
    "operator" => "\u{1F464}",
    "coordinator" => "\u{1F4DE}",
  }.freeze

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, presence: true, inclusion: { in: ROLES }

  ROLES.each { |role| define_method(:"#{role}?") { self.role == role } }
end
