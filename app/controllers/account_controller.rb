class Users::AccountController < Devise::AccountController
  def login
  end

  def createAccount

  	UserMailer.registration_confirmation(resource).deliver unless resource.invalid?
  end
end
