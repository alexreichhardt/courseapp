require_relative '../services/edx_importer'

class EdxJob < ApplicationJob
  queue_as :default

  def perform
    EdxImporter.call
  end
end
