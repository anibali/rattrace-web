require 'rails_helper'

RSpec.describe Report, type: :model do
  describe 'creation' do
    context 'valid attributes' do
      it 'should be valid' do
        report = FactoryGirl.build(:report)
        expect(report).to be_valid
      end
    end

    context 'invalid attributes' do
      it 'should not be valid' do
        report = FactoryGirl.build(:report, trap_id: nil)
        expect(report).to_not be_valid
      end
    end
  end
end
