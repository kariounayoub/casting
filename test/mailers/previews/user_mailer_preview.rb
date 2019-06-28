class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.last
    UserMailer.with(user: user).welcome
  end

  def inscription
    user = User.last
    inscription = user.inscriptions.last
    UserMailer.with(inscription: inscription).inscription
  end

  def convocation
    UserMailer.with(convocation: Convocation.last).convocation
  end
end
