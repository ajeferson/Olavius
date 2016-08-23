namespace :user do

  desc 'Creates an admin user'
  task :create_admin, [:name, :email, :password] => [:environment] do |_, args|
    User.create!(
        name: args[:name],
        email: args[:email],
        password: args[:password],
        role: User.roles[:admin]
    )
    puts 'Admin created successfully!'
  end

end
