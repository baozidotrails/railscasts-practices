class Book < ActiveRecord::Base
  attr_reader :author_token

  has_many :authorships
  has_many :authors, through: :authorships

  def author_token=(tokens)
    self.author_ids = Author.ids_from_tokens(tokens)
  end
end
