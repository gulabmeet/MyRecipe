class Chef < ActiveRecord::Base
    has_many :recipes
    before_save { self.email = email.downcase }
    validates :chefname, presence: true, length: {minimum: 2, maximum: 40}
    VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
    validates :email, presence: true, length: {maximum: 100}, uniqueness: { case_sensitive: false },
                                      format: { with: VALID_EMAIL_REGEX }
    
end    