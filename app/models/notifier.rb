class Notifier
  def send_notifications
    trap_alerts = {}
    Trap.all.each do |trap|
      last_report = trap.reports.order('sent_at').last
      if last_report.present? && last_report.sent_at < 3.minutes.ago
        trap_alerts[trap.id] ||= []
        trap_alerts[trap.id] << {last_report_at: last_report.sent_at}
      end
    end
    User.all.each do |user|
      NotificationMailer.notification_email(user, trap_alerts).deliver_now
    end
  end
end
