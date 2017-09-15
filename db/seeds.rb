# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.all.each do |category|
  category.posts_count = category.posts.count
  category.save
end

Post.all.each do |post|
  post.comments_count = post.comments.count
  post.save
end