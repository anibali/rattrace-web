class ReportChunk < ActiveRecord::Base
  CHUNK_TYPES = {
    battery_level:  1,
    bait_level:     2
  }.freeze

  validates_presence_of :trap_id, :chunk_type, :timestamp, :data
  validates_uniqueness_of :timestamp, scope: [:trap_id, :chunk_type]

  serialize :data, Hash
end
