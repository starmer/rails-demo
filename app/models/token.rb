class Token < ActiveRecord::Base
  validates_uniqueness_of :token
  
  DEFAULT_LENGTH = 4
  DEFAULT_CHARACTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890'
  
  def self.create(length = DEFAULT_LENGTH, characters = DEFAULT_CHARACTERS)
    token = Token.create_token(length, characters)
    super(:token => token)
  end
  
  def self.create_token(length, characters)
    token = ''
    srand
    length.times do
      pos = rand(characters.length)
      token += characters[pos..pos]
    end
    token
  end
end
