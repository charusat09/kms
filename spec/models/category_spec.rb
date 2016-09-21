require 'spec_helper'
describe Category do
  it 'Category is successfully created' do
    category = Category.create(title: 'test2',description: 'category test4')
    expect(Category.last.title).to eq(category.title)
  end
end

