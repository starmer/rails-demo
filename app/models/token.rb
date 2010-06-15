class Token < ActiveRecord::Base
  validates_uniqueness_of :token
  
  TOKEN_LENGTH = 4
  
  def self.create
    token = Token.create_token
    super(:token => token)
  end
  
  def self.create_token
    characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890'
    token = ''
    srand
    TOKEN_LENGTH.times do
      pos = rand(characters.length)
      token += characters[pos..pos]
    end
    puts token
    token
  end
end
