namespace :send_mail do
  desc 'send batch welcome emails'
  task welcome_all: :environment do
    SendWelcomeAllJob.perform_later
  end
end
