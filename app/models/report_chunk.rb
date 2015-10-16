class ReportChunk < ActiveRecord::Base
  CHUNK_TYPES = {
    battery_level:  1,
    bait_level:     2
  }.freeze

  belongs_to :trap

  validates_presence_of :trap_id, :chunk_type, :generated_at, :data
  validates_uniqueness_of :generated_at, scope: [:trap_id, :chunk_type]

  serialize :data, Hash

  def generated_at=(value)
    value = Time.at(value) if value.is_a? Numeric
    super(value)
  end
end
