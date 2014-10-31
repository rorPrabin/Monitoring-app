class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def choose_password(user, password)
    @user = user
    password = @user.password
    mail(to: @user.email, subject: "Choose Password")
  end

end
