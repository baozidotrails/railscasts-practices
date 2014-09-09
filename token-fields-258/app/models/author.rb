class Author < ActiveRecord::Base
  has_many :authorships
  has_many :books, through: :authorships

  # @authors = Author.order(:name)
  # It's an assignment so we use class method
  # http://www.railstips.org/blog/archives/2009/05/11/class-and-instance-methods-in-ruby/
  def self.tokens(query)
    authors = where("name LIKE ?", "%#{query}%")
    if authors.empty?
      [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
    else
      authors
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(name: $1).id }
    tokens.split(',')
  end
end
