require_relative '../services/udacity_importer'

class UdacityJob < ApplicationJob
  queue_as :default

  def perform
    UdacityImporter.call
  end
end
