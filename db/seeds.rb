# Create users

15.times do |i|
  User.create(first_name: 'John', last_name: 'Wick', nickname: "JhonWick#{i + 1}", email: "JhonWick#{i + 1}@gmail.com", password: "password")
end

# Create tweets
200.times do |i|
  Tweet.create(content: "Test content", author_id: rand(1..15))
end
