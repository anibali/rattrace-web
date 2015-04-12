class ReportsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  http_basic_authenticate_with name: "udp_server", password: "super_secret_password", only: :create

  def create
    # TODO: Do something with the report
    render plain: "OK"
  end
end
