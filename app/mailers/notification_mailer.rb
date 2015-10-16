class NotificationMailer < ApplicationMailer
  def notification_email(user, trap_alerts)
    @user = user
    @trap_alerts = trap_alerts
    mail(to: @user.email, subject: 'RatTrace notifications')
  end
end
