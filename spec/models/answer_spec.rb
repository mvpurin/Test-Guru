require 'rails_helper'

RSpec.describe Answer, type: :model do
  let!(:user) { create(:user) }
  let!(:category) { create(:category) }
  let!(:test) { create(:test, author: user, category: category) }
  let!(:question) { create(:question, test: test) }
  let!(:answers) { create_list(:answer, 4, question: question) }

  it 'should belong to question' do
    answer = Answer.new(body: 'test_body', question: question)
    expect(answer.question.id).to eq(question.id)
  end

  it 'should validate presence of body' do
    answer = Answer.new(body: '', question: question)
    expect(answer).to_not be_valid
  end

  it 'should not be more then 4 answers' do
    answer = Answer.new(body: 'test_body', question: question)
    expect(answer).to_not be_valid
  end
end