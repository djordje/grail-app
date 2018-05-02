# frozen_string_literal: true

# :nodoc:
class User < ActiveRecord::Base
  EMAIL_REGEXP = /.*@.*\..*/

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEXP
end
