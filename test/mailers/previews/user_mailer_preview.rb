class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.first
    UserMailer.with(user: user).welcome
  end

  def inscription
    user = User.last
    inscription = user.inscription.last
    UserMailer.with(inscription: inscription).inscription
  end
end