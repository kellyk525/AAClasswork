

class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :session_token, presence: true, uniqueness: true
    validates :password, length: { minimum: 6, allow_nil: true }

    before_validation :ensure_session_token

    attr_reader :password


    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        user && user.is_password?(password) ? user : nil
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64(16)
    end

    def reset_session_token!
        self.update!(session_token: SecureRandom.urlsafe_base64(16))
        self.session_token
    end
end


# def password=(password)
#     self.password_digest = BCrypt::Password.create(password)
#     @password = password
# end

# def is_passord?(password)
#     BCrypt::Password.new(self.password_digest).is_password?(password)
# end

# def reset_session_token!
#     self.update!(session_token: SecureRandom.urlsafe_base64(16))
#     self.session_token
# end

# def ensure_session_token
#     self.session_token ||= SecureRandom.urlsafe_base64(16)
# end

# def self.find_by_credentials(email, password)
#     user = User.find_by(email: email)
#     user && user.is_password?(password) ? user : nil
# end