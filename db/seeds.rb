# Create a user with your own email and a known password
email = 'yaehyaa3@gmail.com'
known_password = 'aA#12345678'

user_data = [
  User.new(email: email, encrypted_password: Devise::Encryptor.digest(User, known_password))
]

user_data.each do |user|
  user.save(validate: false)
end
