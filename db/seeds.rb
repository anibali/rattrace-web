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

bait_level = 100.0
battery_level = 5500.0

10.times do |i|
  time = Time.new(2015, 8, 1) + i.days

  report = trap.reports.create(sent_at: time + 5.minutes)

  1.upto(2).each do |bait_id|
    trap.report_chunks.create(
      chunk_type: ReportChunk::CHUNK_TYPES[:bait_level],
      generated_at: time + bait_id.minutes,
      data: {bait_id: bait_id, level: (bait_level - (2 * random.rand + 3) * bait_id)})
  end

  trap.report_chunks.create(
    chunk_type: ReportChunk::CHUNK_TYPES[:battery_level],
    generated_at: Time.new(2015, 8, 1) + i.days,
    data: {level: battery_level})

  bait_level -= 5 + 5 * random.rand
  bait_level = 0 if bait_level < 0
  battery_level -= 55 + 20 * random.rand
  battery_level = 0 if battery_level < 0
end
