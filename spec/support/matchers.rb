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

# <title>
RSpec::Matchers.define :have_title do |title|
  match do |page|
    page.should have_selector('title', text: title)
  end
end


# <h1>
RSpec::Matchers.define :have_h1 do |title|
  match do |page|
    page.should have_selector('h1', text: title)
  end
end

# Error flash
RSpec::Matchers.define :flash_error do |error_msg|
  match do |page|
    if !error_msg.nil?
      page.should have_selector('div.flash.error', text: error_msg)
    else
      page.should have_selector('div.flash.error')
    end
  end
end


# Success flash
RSpec::Matchers.define :flash_success do |success_msg|
  match do |page|
    if !success_msg.nil?
      page.should have_selector('div.flash.success', text: success_msg)
    else
      page.should have_selector('div.flash.success')
    end
  end
end