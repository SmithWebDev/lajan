User.create!({
               name: FFaker::Name.name,
               password: 'Password',
               username: FFaker::Internet.unique.user_name,
               email: FFaker::Internet.email
             })

