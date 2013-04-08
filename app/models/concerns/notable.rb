module Notable
  extend ActiveSupport::Concern

  included do
    has_many :notes, as: :notable, order: 'created_at desc'
  end

end