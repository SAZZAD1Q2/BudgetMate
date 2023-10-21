# Create a user with your own email and a known password
email = 'sazzad1q2@gmail.com'
password = 'Sazzad1986#Rupa2000#Saif2019#Yahyaa2023#'

user_data = [
  { email: email, password: password, password_confirmation: password }
]

user_data.each do |user_attrs|
  User.find_or_create_by!(user_attrs)
end
