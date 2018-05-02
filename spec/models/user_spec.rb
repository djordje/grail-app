# frozen_string_literal: true

describe User do
  it { is_expected.to respond_to :email }

  describe 'validations' do
    subject { build(:user) }
    it { is_expected.to be_valid }

    context 'when email is empty' do
      before { subject.email = nil }
      it { is_expected.to be_invalid }
    end

    context 'when email already taken' do
      before { create(:user, email: subject.email) }
      it { is_expected.to be_invalid }
    end

    context 'when invalid email given' do
      before { subject.email = 'invalid.example.com' }
      it { is_expected.to be_invalid }
    end
  end
end
