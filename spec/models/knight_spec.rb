require 'spec_helper'

describe Knight do
  subject { FactoryGirl.create(:knight) }

  describe 'defaults' do
    context 'health' do
      it 'is set to 100' do
        expect(subject.health).to eq 100
      end
    end

    context 'weapon' do
      it 'is a sword' do
        expect(subject.weapon).to eq 'sword'
      end
    end
  end
end
