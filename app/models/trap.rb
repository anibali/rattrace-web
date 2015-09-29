class Trap < ActiveRecord::Base
  has_many :reports, dependent: :destroy
  has_many :report_chunks, dependent: :destroy
end
