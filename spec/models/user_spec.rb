require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { should have_many(:rides) }
  it { should have_many(:drives) }
end
