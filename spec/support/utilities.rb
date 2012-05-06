def full_title(page_title)
  base_title = "YouFood"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def sign_in(user)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Mot de passe", with: user.password
  click_button "Se connecter"
  cookies[:remember_token] = user.remember_token
end

def create_valid_menu
  before do
    fill_in 'menu[name]', with: "Menu test"
    fill_in 'menu[description]', with: "Desc test"
  end
end