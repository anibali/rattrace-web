# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

random = Random.new(42069)

user = User.new(
  email: 'admin@example.com',
  password: 'password')
user.password_confirmation = user.password
user.skip_confirmation!
user.save!

trap = Trap.create(id: 1234)

1.upto(2).each do |bait_id|
  bait_level = 1.0 - 0.2 * (bait_id - 1)
  10.times do |i|
    trap.report_chunks.create(
      chunk_type: ReportChunk::CHUNK_TYPES[:bait_level],
      generated_at: Time.new(2015, 8, 1) + i.days + bait_id.minutes,
      data: {bait_id: bait_id, level: bait_level * 100})
    bait_level -= 0.05 + 0.05 * random.rand
    bait_level = 0 if bait_level < 0
  end
end

battery_level = 1.0
10.times do |i|
  trap.report_chunks.create(
    chunk_type: ReportChunk::CHUNK_TYPES[:battery_level],
    generated_at: Time.new(2015, 8, 1) + i.days,
    data: {level: battery_level * 5500})
  battery_level -= 0.01 + 0.005 * random.rand
  battery_level = 0 if battery_level < 0
end
