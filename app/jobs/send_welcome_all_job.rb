class SendWelcomeAllJob < ApplicationJob
  queue_as :default

  def perform(*args)
    User.all.each do |u|
      UserMailer.with(user: u).welcome.deliver
    end
  end
end

