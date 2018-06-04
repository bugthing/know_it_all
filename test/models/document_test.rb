require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  test 'searchyness of the document' do
    [ 
      ['something', 'something', true],
      ['some thing', 'some', true],
      ['some thing', 'thing', true],
      ['some thing', 'something', false]
    ].each do |content, term, should_find|
      doc = Document.create content: content
      docs = Document.search_for term
      assert docs.include?(doc) == should_find
    end
  end
end
