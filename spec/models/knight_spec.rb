require 'spec_helper'

describe Knight do
  # notice location of subject

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

  # notice the conditionals based on knight's attributes

  describe '#status_check' do
    context 'by default' do
      it 'returns a string with knight information' do
        expect(subject.status_check).to eq 'Knight is carrying a sword and has 100 health'
      end
    end

    context 'given a knight with a spear' do
      let(:knight_with_spear) { FactoryGirl.create(:knight, weapon: 'spear') }

      it 'returns a string with spear' do
        expect(knight_with_spear.status_check).to eq 'Knight is carrying a spear and has 100 health'
      end
    end

    # notice use of stubbing for change_weapon_to method

    context 'given a knight with low health' do
      let(:hurt_knight) { FactoryGirl.create(:knight, health: 5) }

      it 'returns a health warning' do
        expect(hurt_knight.status_check).to eq 'Knight has health of 5 and needs the hospital!'
      end

      it 'removes the weapon' do
        expect(hurt_knight).to receive(:change_weapon_to).with('')
        hurt_knight.status_check
      end
    end
  end

  # testing the effects of the method

  describe '#change_weapon_to' do
    context 'given a string' do
      before { subject.change_weapon_to('spear') }

      it 'updates the knights weapon attribute' do
        expect(subject.weapon).to eq 'spear'
      end
    end

    context 'given an integer' do
      before { subject.change_weapon_to(100) }

      it 'does not update the knight attributes' do
        expect(subject.weapon).to eq 'sword'
      end
    end
  end

  describe '#boost_health' do
    context 'by default' do
      before { subject.boost_health }

      it 'updates the knights health attribute' do
        expect(subject.health).to eq 150
      end
    end

    context 'given an integer' do
      before { subject.boost_health(100) }

      it 'updates the knights health attribute' do
        expect(subject.health).to eq 200
      end
    end
  end
end
