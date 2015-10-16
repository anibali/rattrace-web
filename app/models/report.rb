class Report < ActiveRecord::Base
  belongs_to :trap

  validates_presence_of :trap_id, :sent_at

  def sent_at=(value)
    value = Time.at(value) if value.is_a? Numeric
    super(value)
  end
end
