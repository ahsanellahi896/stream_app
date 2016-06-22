ThinkingSphinx::Index.define :channel, with: :active_record do
  indexes name, sortable: true
  has created_at
end
