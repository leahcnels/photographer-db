require 'rails_helper'

describe Image do
  it { should validate_presence_of :img_file_file_name }
  it { should belong_to :photographer }
end
