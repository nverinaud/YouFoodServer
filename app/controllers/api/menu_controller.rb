# encoding: utf-8

class Api::MenuController < Api::ApiController

  def current_menu
    today = Time.now
    Menu.all.each do |menu|
      menu.schedules.each do |schedule|
        if today >= schedule.start_date && today <= schedule.end_date
          @menu = menu
          render :current_menu
        end
      end
    end
    if (!@menu)
      render text: "Aucun menu n'a été planifié cette semaine. Veuillez contacter le gérant du restaurant", status: 403
    end
  end
end
