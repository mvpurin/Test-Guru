require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should validate_presence_of :body }

  it { should have_many(:answers)}
  it { should have_many(:gists) }

  it { should belong_to(:test) }
end
