class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.first
    UserMailer.with(user: user).welcome
  end

  def inscription
    user = User.first
    inscription = user.inscriptions.last
    UserMailer.with(inscription: inscription).inscription
  end

  def convocation
    UserMailer.with(convocation: Convocation.last).convocation
  end
end
