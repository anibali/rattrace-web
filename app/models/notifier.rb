class Notifier
  include ActionView::Helpers::DateHelper

  def send_notifications
    trap_alerts = {}

    Trap.all.each do |trap|
      alerts = alerts_for_trap(trap)
      trap_alerts[trap.id] = alerts unless alerts.blank?
    end

    User.all.each do |user|
      NotificationMailer.notification_email(user, trap_alerts).deliver_now
    end
  end

  private
  def alerts_for_trap(trap)
    alerts = []

    last_report = trap.last_report
    if last_report.present? && last_report.sent_at < 3.days.ago
      alerts <<
        "quiet since #{distance_of_time_in_words(Time.now, last_report.sent_at)} ago"
    end

    if trap.bait_level < 20
      alerts <<
        ("bait level at %.2f%%" % [trap.bait_level])
    end

    if trap.battery_level < 4.2
      alerts << "battery level low"
    end

    return alerts
  end
end
