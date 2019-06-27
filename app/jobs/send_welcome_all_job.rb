class SendWelcomeAllJob < ApplicationJob
  queue_as :default

  def perform(*args)
    (User.where(caster: nil, admin: nil) - User.joins(:inscriptions).all).each do |u|
      UserMailer.with(user: u).welcome.deliver
    end
  end
end

