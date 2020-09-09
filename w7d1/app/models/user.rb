# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :user_name, :password_digest, :session_token, presence: true 
    validates :user_name, :session_token, uniqueness: true
    validates :session_token, uniqueness: {scope: :user_name} 
    validates :password, length: {minimum: 6, allow_nil: true }

    attr_reader :password
    before_validation :ensure_session_token

    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name) 
            if user && user.is_password?(password) 
                user 
            else
                nil 
            end
    end

    # I want ask about the order, because we are returning the raw password
    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password) 
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token 
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
end
