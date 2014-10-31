class MonitoringMailer < ActionMailer::Base
  default from: "noreply@emonitoring.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.monitoring_mailer.site_down.subject
  #
  def site_down(project)
    @project = project
    @user = project.creator
    @greeting = "Hi"
    address = @user.email
    mail to: address
  end
end
