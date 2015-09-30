class TrapsController < ApplicationController
  before_action :authenticate_user!

  def show
    @trap = Trap.find(params[:id])

    bait_data = @trap.report_chunks
      .where(chunk_type: ReportChunk::CHUNK_TYPES[:bait_level])
      .map do |chunk|
        [chunk.data[:bait_id], chunk.timestamp.to_i * 1000, chunk.data[:level] * 100]
      end
      .group_by(&:first)
      .map do |(bait_id, rows)|
        [bait_id, rows.map {|r| r[1..-1]}]
      end

    @bait_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart type: 'line', borderWidth: '1',
        spacingBottom: 20, spacingTop: 20,
        spacingLeft: 20, spacingRight: 20
      # f.title text: 'Bait level history'
      # f.subtitle text: 'Subtitle'
      f.xAxis title: {text: 'Time'}, type: 'datetime'
      f.yAxis title: {text: 'Bait level (%)'}, min: 0, max: 100
      f.legend enabled: true

      bait_data.each do |(bait_id, series_data)|
        f.series(name: "Bait ##{bait_id}", type: 'area', data: series_data)
      end
    end

    battery_data = @trap.report_chunks
      .where(chunk_type: ReportChunk::CHUNK_TYPES[:battery_level])
      .map do |chunk|
        [chunk.timestamp.to_i * 1000, chunk.data[:level] * 100]
      end

    @battery_chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart type: 'line', borderWidth: '1',
        spacingBottom: 20, spacingTop: 20,
        spacingLeft: 20, spacingRight: 20
      # f.title text: 'Battery level history'
      # f.subtitle text: 'Subtitle'
      f.xAxis title: {text: 'Time'}, type: 'datetime'
      f.yAxis title: {text: 'Battery level (%)'}, min: 0, max: 100
      f.legend enabled: false

      f.series(type: 'area', data: battery_data)
    end
  end
end
