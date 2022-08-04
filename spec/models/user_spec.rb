RSpec.describe 'User', type: :model do
  subject do
    User.new(name: 'Treasure', id: 1, email: 'S@J', created_at: '2020', updated_at: '2021', password: '123456')
  end
  before { subject.save }

  it 'name should not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'email should not be empty' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
