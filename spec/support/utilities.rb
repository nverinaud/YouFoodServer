def sign_in(user)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Mot de passe", with: user.password
  click_button "Se connecter"
  cookies[:remember_token] = user.remember_token
end