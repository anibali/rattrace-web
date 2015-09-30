require 'rails_helper'

RSpec.describe TrapsHelper, type: :helper do
  describe 'bait_level_chart' do
    it 'returns Highcharts code to embed in HTML' do
      chart = helper.bait_level_chart([])

      expect(chart).to match(/^<.*>.*<\/.*>$/);
      expect(chart).to match(/new Highcharts/)
    end
  end

  describe 'battery_level_chart' do
    it 'returns Highcharts code to embed in HTML' do
      chart = helper.battery_level_chart([])

      expect(chart).to match(/^<.*>.*<\/.*>$/);
      expect(chart).to match(/new Highcharts/)
    end
  end
end
