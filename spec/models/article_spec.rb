require 'spec_helper'
describe Article do
  it 'Article is successfully created' do
    article = Article.create(title: 'test4',s_description: 'article test4',user_id: 1)
    expect(Article.last.title).to eq(article.title)
  end
end

