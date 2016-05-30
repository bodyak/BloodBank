# -*- encoding : utf-8 -*-

class ApplicationController < ActionController::Base

  CODE_ORG = 21
  VISIT = [I18n.t("for_select.type_donation.first"),
           I18n.t("for_select.type_donation.first_year"),
           I18n.t("for_select.type_donation.repeat")]

  protect_from_forgery

end
