class User < ApplicationRecord
  has_secure_password

  has_many :products
  has_many :reviews, dependent: :nullify
  has_many :likes, dependent: :destroy
  has_many :liked_campaigns, through: :likes, source: :review

  has_many :votes, dependent: :destroy
  has_many :voted_questions, through: :votes, source: :review


 validates(:first_name, { presence: true })
 validates(:last_name, { presence: true })
 validates(:email, { presence: true, uniqueness: true})

 def generate_api_token
   loop do
   self.api_token = SecureRandom.urlsafe_base64(32)
   break unless User.exists?(api_token: self.api_token)
   end
 end
 
def self.search(search_term)
  where(['first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?', "%#{search_term}%", "%#{search_term}%", "%#{search_term}%"])
end

def self.created_after(date)
  where(['created_at > ?', "#{date}"])
end

def self.is_not(name)
  where('first_name != ? AND last_name != ?', "#{name}", "#{name}")
end
end
