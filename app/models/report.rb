class Report < ActiveRecord::Base
  validates_presence_of :trap_id
end
