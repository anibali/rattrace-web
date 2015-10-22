class Trap < ActiveRecord::Base
  has_many :reports, dependent: :destroy
  has_many :report_chunks, dependent: :destroy

  def battery_level
    report_chunks
      .where(chunk_type: ReportChunk::CHUNK_TYPES[:battery_level])
      .order('generated_at DESC')
      .limit(1)
      .first.data[:level] / 1000.0
  end

  def bait_level
    report_chunks
      .where(chunk_type: ReportChunk::CHUNK_TYPES[:bait_level])
      .order('generated_at DESC')
      .limit(10) # WARNING: This makes assumptions
      .group_by{|chunk| chunk.data[:bait_id]}
      .map{|k, vs| [k, vs.first.data[:level]]}
      .sort_by(&:second).first.second
  end

  def last_report
    reports.order('sent_at').last
  end
end
