# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

random = Random.new(42069)

trap = Trap.create(id: 1234)

bait_level = 1.0
10.times do |i|
  trap.report_chunks.create(
    chunk_type: ReportChunk::CHUNK_TYPES[:bait_level],
    timestamp: Time.new(2015, 8, 1) + i.days,
    data: {bait_id: 1, level: bait_level})
  bait_level -= 0.1 + 0.1 * random.rand
  bait_level = 0 if bait_level < 0
end
