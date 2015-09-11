class ReportsController < ApplicationController
  UDP_SERVER_ACTIONS = [:create]

  skip_before_filter :verify_authenticity_token, only: UDP_SERVER_ACTIONS
  http_basic_authenticate_with name: ENV['UDP_USER'],
    password: ENV['UDP_PASS'], only: UDP_SERVER_ACTIONS
  before_action :authenticate_user!, except: UDP_SERVER_ACTIONS

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
