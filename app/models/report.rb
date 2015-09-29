class Report < ActiveRecord::Base
  belongs_to :trap

  validates_presence_of :trap_id
end
