require 'spec_helper'

describe Recipient do
  it { should have_and_belong_to_many :texts }
end

