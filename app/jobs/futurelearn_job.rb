require_relative '../services/futurelearn_importer'

class FuturelearnJob < ApplicationJob
  queue_as :default

  def perform
    FuturelearnImporter.call
  end
end
