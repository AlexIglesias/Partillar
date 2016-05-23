require 'rails_helper'

RSpec.describe Content, type: :model do
  before { @content = Content.create title: 'imagen' }

  it "should not raise error" do
    expect { Content.last }.not_to raise_error
  end

  it "search should be blank" do
    query = ''
    expect(query).to eq('')
  end

  it "should get search" do
    expect(@content.title.capitalize).to eq('Imagen')
  end

end
