task :users => :environment do
  %w[ userone user test ].map do |name|
    begin
      user = User.new email:                 "#{ name }@testing.com",
                      first_name:                  "#{name}",
                      last_name:                   "#{name}",
                      password:              'testings',
                      password_confirmation: 'testings',
                      admin:                  true
 
      user.save
    rescue ActionView::Template::Error
      puts "There was a problem creating #{ name }!"
    end
    user.save
  end
end