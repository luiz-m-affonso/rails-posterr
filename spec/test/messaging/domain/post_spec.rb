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
    end
  end
end
