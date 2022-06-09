require 'rails_helper'

describe Reviews do
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_of_body }
  it { should validate_presence_of :rating }
  
  it { should belong_to :product }
end