require 'spec_helper'
describe Tag do
  it 'Tag is create' do
    tag = Tag.create(name: 'Prakash')
    expect(Tag.last.name).to eq(tag.name)
  end
end

