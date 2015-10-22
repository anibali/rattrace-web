class TrapsController < ApplicationController
  before_action :authenticate_user!

  def index
    @traps = Trap.all
  end

  def show
    @trap = Trap.find(params[:id])

    @report_chunks = @trap.report_chunks
      .where('generated_at >= ?', 1.year.ago)
      .order('generated_at')
  end

  def destroy
    @trap = Trap.find(params[:id])
    @trap.destroy

    redirect_to action: :index
  end
end
