class ReportsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  http_basic_authenticate_with name: "udp_server", password: "super_secret_password", only: :create

  def create
    @report = Report.new(report_params)
    @report.save

    render plain: "OK"
  end

  def index
    @reports = Report.order(created_at: :desc)
  end

  private
  def report_params
    params.require(:report).permit(:original_message, :trap_id)
  end
end
