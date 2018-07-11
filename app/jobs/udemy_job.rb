require_relative '../services/udemy_importer'

class UdemyJob < ApplicationJob
  queue_as :default

  def perform
    UdemyImporter.call
  end
end
