# encoding: utf-8

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_signout_link do
  match do |page|
    page.should have_link('Se déconnecter', href: signout_path)
  end
end

RSpec::Matchers.define :have_title do |text|
  match do |page|
    page.should have_selector('title', text: text)
  end
end