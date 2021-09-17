require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(id: 1, name: 'joe', email: 'erezfree39@gmail.com', password: 'Newblue29*') }
  let(:group) { Group.create(name: 'Mackdonalds', author_id: user.id) }

  context 'should create new group successfully' do
    it 'should return group name' do
      expect(group.name).to eq('Mackdonalds')
    end
    it 'should return author_id' do
      expect(group.author_id).to eq(1)
    end
  end
  describe 'ActiveRecord associations' do
    it 'has many entites' do
      expect { should has_many(entities) }
    end
    it 'belongs to an user' do
      expect { should belong_to(user).with_foreign_key }
    end
  end
end
