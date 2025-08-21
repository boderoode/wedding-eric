namespace :admin do
  desc "Create admin user for wedding management"
  task create_user: :environment do
    email = "bo_deroode@outlook.com"
    password = "mobmuj-bogwah-daqXe1" # You should change this to something secure

    # Check if user already exists
    if User.find_by(email: email)
      puts "User with email #{email} already exists!"
    else
      # Create the user
      user = User.create!(
        email: email,
        password: password,
        password_confirmation: password
      )

      puts "Successfully created admin user:"
      puts "Email: #{user.email}"
      puts "Password: #{password}"
      puts ""
      puts "You can now sign in at: http://localhost:3000/users/sign_in"
      puts "Please change the password after first login!"
    end
  end
end
