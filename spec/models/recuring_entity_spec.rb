require 'rails_helper'

RSpec.describe RecuringEntity, type: :model do
  let(:user) { User.create(id: 1, name: 'joe', email: 'erezfree39@gmail.com', password: 'Newblue29*') }
  let(:group) { Group.create(id: 1, name: 'Mackdonalds', author_id: user.id) }
  let(:entity) do
    Entity.create(id: 1, name: 'Sausage', amount: 2.5,
                  occured: Time.now, external: true, external_group_name: 'hotdog stand', author_id:
                  user.id, group_id: group.id)
  end
  let(:recuring_entity) { RecuringEntity.create(entity_id: entity.id, repeat: 'weekly') }

  it 'should return the recuring entity entity_id' do
    expect(recuring_entity.entity_id).to eq(1)
  end

  it 'should return that it repeates weekly' do
    expect(recuring_entity.repeat).to eq('weekly')
  end
end

describe 'validations' do
  let(:user) { User.create(id: 1, name: 'joe', email: 'erezfree39@gmail.com', password: 'Newblue29*') }
  let(:group) { Group.create(id: 1, name: 'Mackdonalds', author_id: user.id) }
  let(:entity) do
    Entity.create(id: 1, name: 'Sausage', amount: 2.5,
                  occured: Time.now, external: true, external_group_name: 'hotdog stand', author_id:
                  user.id, group_id: group.id)
  end

  subject do
    RecuringEntity.new(
      entity_id: 1,
      repeat: 'weekly'
    )
  end

  it 'validate presence of event_id' do
    expect { should validate_presence_of(:entity_id) }
  end

  it 'validate presence of repeat' do
    expect { should validate_presence_of(:repeat) }
  end

  it 'validate uniqueness of event_id' do
    expect { should validate_uniqueness_of(:entity_id) }
  end
end
