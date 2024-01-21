module Trackable
  extend ActiveSupport::Concern

  included do
    after_create :track_created_changes
    after_update :track_updated_changes

    private

    def track_created_changes
      histories.create(action: 'create', user_id: user_id, tracked_changes: previous_changes)
    end

    def track_updated_changes
      histories.create(action: 'update', user_id: user_id, tracked_changes: previous_changes)
    end
  end
end
