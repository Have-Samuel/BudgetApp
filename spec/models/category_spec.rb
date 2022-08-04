RSpec.describe 'Category', type: :model do
  subject do
    User.new(name: 'Fed', id: 1, email: 'have@gmail.com', created_at: '2020', updated_at: '2021', password: '123456')
  end
  before { subject.save }

  it 'name should not be empty' do
    category = Category.new(id: 1, name: 'Grocery', icon: 'grocery', created_at: '2020', updated_at: '2022',
                            user_id: subject.id)
    category.name = nil
    expect(category).to_not be_valid
  end

  it 'icon should not be empty' do
    category = Category.new(id: 1, name: 'Grocery', icon: 'grocery', created_at: '2020', updated_at: '2022',
                            user_id: subject.id)
    category.icon = nil
    expect(category).to_not be_valid
  end
end
