require 'rails_helper'

RSpec.describe ReportChunk, type: :model do
  describe 'creation' do
    context 'valid attributes' do
      it 'should be valid' do
        chunk = FactoryGirl.build(:report_chunk)
        expect(chunk).to be_valid
      end
    end

    context 'invalid attributes' do
      it 'should not be valid' do
        chunk = FactoryGirl.build(:report_chunk, chunk_type: nil)
        expect(chunk).to_not be_valid
      end
    end

    context 'duplicate chunk' do
      it 'should not be valid' do
        existing_chunk = FactoryGirl.create(:report_chunk)
        chunk = FactoryGirl.build(:report_chunk)
        expect(chunk).to_not be_valid
      end
    end
  end
end
