# rubocop:disable all
require 'rails_helper'
RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Erez', email: 'erezfree29@gmail.com', password: '123456') }
  context 'should create new user successfully' do
    it 'should return user name' do
      expect(user.name).to eq('Erez')
    end

    it 'should validate password' do
      expect(user.email).to eq('erezfree29@gmail.com')
    end

    it 'should return user password' do
      expect(user.password).to eq('123456')
    end
  end

  describe 'ActiveRecord associations' do
    it 'has many entities' do
      expect { should has_many(entity) }
    end
    it 'has many groups' do
      expect { should has_many(groups) }
    end
  end
end