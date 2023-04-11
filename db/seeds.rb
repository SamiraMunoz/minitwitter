# Create users

5.times do |i|
  User.create(first_name: 'John', last_name: 'Wick', nickname: "JhonWick#{i + 1}")
end
