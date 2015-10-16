class TrapsController < ApplicationController
  before_action :authenticate_user!

  def show
    @trap = Trap.find(params[:id])

    @report_chunks = @trap.report_chunks
      .where('generated_at >= ?', 1.year.ago)
  end
end
