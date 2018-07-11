namespace :api_data do
  desc "Fetching data from all API & storing to DB"
  task fetch_edx: :environment do
    EdxJob.perform_later
  end

  task fetch_udacity: :environment do
    UdacityJob.perform_later
  end

  task fetch_udemy: :environment do
    UdemyJob.perform_later
  end

end
