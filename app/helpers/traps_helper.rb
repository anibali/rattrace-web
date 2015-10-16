module TrapsHelper
  def bait_level_chart(report_chunks)
    bait_data = report_chunks
      .select {|chunk| chunk.chunk_type == ReportChunk::CHUNK_TYPES[:bait_level]}
      .map do |chunk|
        [chunk.data[:bait_id], chunk.generated_at.to_i * 1000, chunk.data[:level]]
      end
      .group_by(&:first)
      .map do |(bait_id, rows)|
        [bait_id, rows.map {|r| r[1..-1]}]
      end

    graph = time_series_graph do |f|
      f.yAxis title: {text: 'Bait level (%)'}, min: 0, max: 100
      f.legend enabled: true
      bait_data.each do |(bait_id, series_data)|
        f.series(name: "Bait ##{bait_id}", type: 'area', data: series_data)
      end
    end

    high_chart("bait_chart", graph)
  end

  def battery_level_chart(report_chunks)
    battery_data = report_chunks
      .select {|chunk| chunk.chunk_type == ReportChunk::CHUNK_TYPES[:battery_level]}
      .map do |chunk|
        [chunk.generated_at.to_i * 1000, chunk.data[:level] / 1000.0]
      end

    graph = time_series_graph do |f|
      f.yAxis title: {text: 'Battery level (V)'}, min: 0, max: 6
      f.legend enabled: false
      f.series(type: 'area', data: battery_data)
    end

    high_chart("battery_chart", graph)
  end

  private

  def time_series_graph
    LazyHighCharts::HighChart.new('graph') do |f|
      f.chart type: 'line', borderWidth: '1',
        spacingBottom: 20, spacingTop: 20,
        spacingLeft: 20, spacingRight: 20
      f.xAxis title: {text: 'Time'}, type: 'datetime'

      yield f
    end
  end
end
