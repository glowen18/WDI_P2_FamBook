module UsersHelper
  def password=(word)
    self.password_digest = "$2a$10$djkCu..."
    @password = word
  end

  def password_confirmation=(word)
    @password_confirmation = word
  end
end
