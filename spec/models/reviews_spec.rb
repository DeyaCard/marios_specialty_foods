require 'rails_helper'

describe Reviews do
  it { should belong_to(:products) }
end