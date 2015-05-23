module Archiveable
  extend ActiveSupport::Concern

  def self.included(klass)
    klass.instance_eval do
      scope :visiable, ->{ where(deleted_at: nil) }
    end
  end

  def archive
    update_column(:deleted_at, Time.zone.now)
  end
end