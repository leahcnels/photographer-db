require 'rails_helper'

describe Photographer do
  it { should validate_presence_of :name }
  it { should validate_presence_of :address }
  it { should have_many :images }
  it { should have_and_belong_to_many :categories }
end
