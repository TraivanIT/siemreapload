# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
traivan = Traivan.create!(
	fullname: "adminstrator",
	username: "traivan@admin.com",
	password: "12345678")
puts "Create admin"
30.times do 
	post = Post.create!(
		title: Faker::Lorem.sentence(10),
		content: Faker::Lorem.paragraph,
		publish: true,
		traivan: traivan
		)

	tag = Tag.create!(name: Faker::Lorem.word)
	
	post_tag = PostTag.create!(post: post, tag: tag)

	visitor = Visitor.create!(
		fullname: Faker::Name.name,
		email: Faker::Internet.email
		)

	comment = Comment.create!(
		message: Faker::Lorem.paragraph,
		status: [true , false].sample,
		post: post,
		visitor: visitor
		)

	message = Message.create!(
		content: Faker::Lorem.paragraph,
		status: [true , false].sample,
		visitor: visitor
		)

	notifiable =[ visitor, comment].sample
	notification = Notification.create!(
		notifiable_id: notifiable.id,
		notifiable_type: notifiable.class.name)
	
end 
puts "30 post created"