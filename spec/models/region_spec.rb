require 'spec_helper'

describe Region do
  it { should have_many(:farms) }
end