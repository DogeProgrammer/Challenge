# frozen_string_literal: true

shared_examples 'sucessful request' do
  it 'returns 200 HTTP status' do
    expect(response).to be_ok
  end

  it 'returns Content-Type application/json' do
    expect(response.content_type).to eq('application/json')
  end
end
