RSpec.describe 'Entity', type: :model do
  subject do
    User.new(name: 'Adrine', id: 1, email: 'have@mail.ru', created_at: '2021', updated_at: '2022', password: '123456')
  end
  before { subject.save }

  it 'name should not be empty' do
    category = Category.new(id: 1, name: 'Shopping', icon: 'food', created_at: '2020', updated_at: '2022',
                            user_id: subject.id)
    entity = Entity.new(id: 1, name: 'Swimming', amount: 4, created_at: '2020', updated_at: '2022',
                        category_id: category.id, user_id: subject.id)
    entity.name = nil
    expect(entity).to_not be_valid
  end
  it 'amount should not be empty' do
    category = Category.new(id: 1, name: 'Schooling', icon: 'Books', created_at: '2020', updated_at: '2022',
                            user_id: subject.id)
    entity = Entity.new(id: 1, name: 'Surfing', amount: 4, created_at: '2020', updated_at: '2022',
                        category_id: category.id, user_id: subject.id)
    entity.amount = nil
    expect(entity).to_not be_valid
  end
end
