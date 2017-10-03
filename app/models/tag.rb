class Tag < ApplicationRecord
  has_and_belongs_to_many :posts

  def self.tags(query)
    tags = where('name like ?', "%#{query}%")
    if tags.empty?
      [{id: "<<<#{query}>>>", name: "New: \"#{query}\""}]
    else
      tags = tags.to_a
      tags << {id: "<<<#{query}>>>", name: "New: \"#{query}\""} unless tags.include? Tag.find_by_name(query)
      tags
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) {create!(name: $1).id}
    tokens.split(',')
  end
end
