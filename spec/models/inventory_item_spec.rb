require 'spec_helper'

describe InventoryItem do
  let(:blanks) { ['', nil] }

  it { should have_valid(:title).when('A Title') }
  it { should_not have_valid(:title).when(*blanks) }
  it { should have_valid(:description).when('I am a description ya ya yahhh!') }
  it { should_not have_valid(:description).when(*blanks) }
  it { should have_valid(:quantity).when(9) }
  it { should_not have_valid(:quantity).when(*blanks) }
  it { should validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:quantity).only_integer }
end
