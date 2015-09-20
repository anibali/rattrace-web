FactoryGirl.define do
  factory :report_chunk do
    trap_id     1234
    chunk_type  ReportChunk::CHUNK_TYPES[:battery_level]
    timestamp   '2015-09-20 19:09:36'
    data        battery_charge: 0.5
  end
end
