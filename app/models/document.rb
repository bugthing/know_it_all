class Document < ApplicationRecord
  include PgSearch

  pg_search_scope :search_for, against: %i(content), using: { tsearch: { any_word: true } }
end
