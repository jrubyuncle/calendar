module Archiveable
  extend ActiveSupport::Concern

  included do
    default_scope -> { where(deleted_at: nil) }
  end

  def archive
    update_column(:deleted_at, Time.zone.now)
  end
end