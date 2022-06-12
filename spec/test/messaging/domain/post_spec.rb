module Messaging
  module Domain
    describe Post do
      describe '#initialize' do
        let(:post) {
          described_class.new(
            id: 1,
            title: 'title',
            description: 'description',
            text: 'text',
            type: 'type',
            user_id: 1
          )
        }

        it 'respond to attributes' do
          expect(post).to respond_to(:id)
          expect(post).to respond_to(:title)
          expect(post).to respond_to(:description)
          expect(post).to respond_to(:text)
          expect(post).to respond_to(:type)
          expect(post).to respond_to(:user_id)
        end
      end

      describe '#to_hash' do
        let(:post) {
          described_class.new(
            id: 1,
            title: 'title',
            description: 'description',
            text: 'text',
            type: 'type',
            user_id: 1
          )
        }

        it 'returns a hash' do
          expect(post.to_hash).to be_a(Hash)
        end

        it 'returns a hash with the correct keys' do
          expect(post.to_hash.keys).to eq([:id, :title, :description, :text, :type, :user_id])
        end

        it 'returns a hash with the correct values' do
          expect(post.to_hash.values).to eq([1, 'title', 'description', 'text', 'type', 1])
        end
      end
    end
  end
end
