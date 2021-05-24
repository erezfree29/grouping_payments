require 'rails_helper'

RSpec.describe Entity, type: :model do
  # create external entity(transaction)
  let(:user) { User.create(id: 1, name: 'joe', email: 'erezfree39@gmail.com', password: 'Newblue29*') }
  let(:entity_external) do
    Entity.create(name: 'Sausage', amount: 2.5,
                  occured: Time.now, external: true, external_group_name: 'hotdog stand', author_id: user.id)
  end
  it 'should return that the entity is external' do
    expect(entity_external.external).to eq(true)
  end
  it "should return that the user's id" do
    expect(entity_external.author_id).to eq(1)
  end
end

describe 'validations' do
  let(:user) { User.create(id: 1, name: 'joe', email: 'erezfree39@gmail.com', password: 'Newblue29*') }
  let(:group) { Group.create(name: 'Mackdonalds', author_id: user.id) }
  subject do
    Entity.new(
      title: 'burger',
      author_id: user.id,
      amount: 2.5,
      group_id: group.id,
      occured: Time.now,
      external: false
    )
  end
  it 'validate presence of author' do
    expect { should validate_presence_of(:author) }
  end

  it 'validate presence of amout' do
    expect { should validate_presence_of(:amout) }
  end

  it 'validate presence of name' do
    expect { should validate_presence_of(:name) }
  end

  it 'validate presence of occured' do
    expect { should validate_presence_of(:name) }
  end
end
