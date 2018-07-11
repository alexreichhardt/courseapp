require_relative '../services/udemy_importer'
require_relative '../services/edx_importer'
require_relative '../services/udacity_importer'

class FetchAllJob < ApplicationJob
  queue_as :default

  def perform
    UdemyImporter.call
    EdxImporter.call
  end
end
