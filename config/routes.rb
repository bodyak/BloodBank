Bloodbank::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :donors do
    as_routes
  end
  # resources :donor_defects do
  #   as_routes
  # end
  # resources :donor_documents do
  #   as_routes
  # end
  resources :visits do
    as_routes
  end
  resources :visitations do
    as_routes
  end
  resources :isolations do
    as_routes
  end
  resources :skins do
    as_routes
  end
  # resources :dictionaries do
  #   as_routes
  # end
  # resources :glossaries do
  #   as_routes
  # end
  resources :cat_donors do
    # as_routes
    record_select_routes
  end
  resources :blood_groups do
    # as_routes
    record_select_routes
  end
  resources :countries do
    # as_routes
    record_select_routes
  end
  resources :districts do
    # as_routes
    record_select_routes
  end
  resources :doctor_chiefs do
    # as_routes
    record_select_routes
  end
  resources :hla_factors do
    # as_routes
    record_select_routes
  end
  resources :org_donates do
    # as_routes
    record_select_routes
  end
  resources :regions do
    # as_routes
    record_select_routes
  end
  resources :rh_factors do
    # as_routes
    record_select_routes
  end
  resources :villages do
    # as_routes
    record_select_routes
  end
  resources :org_addresses do
    # as_routes
    record_select_routes
  end
  resources :org_receptions do
    # as_routes
    record_select_routes
  end
  resources :reg_names do
    # as_routes
    record_select_routes
  end
  resources :receptions do
    # as_routes
    record_select_routes
  end
  resources :send_villages do
    # as_routes
    record_select_routes
  end
  resources :send_orgs do
    # as_routes
    record_select_routes
  end
  resources :send_deps do
    # as_routes
    record_select_routes
  end
  resources :targets do
    # as_routes
    record_select_routes
  end
  resources :target_someones do
    # as_routes
    record_select_routes
  end
  resources :blood_fors do
    # as_routes
    record_select_routes
  end
  resources :rh_controls do
    # as_routes
    record_select_routes
  end
  resources :doctor_tests do
    # as_routes
    record_select_routes
  end
  resources :doctor_aids do
    # as_routes
    record_select_routes
  end
  resources :doctor_skins do
    # as_routes
    record_select_routes
  end
  resources :doctor_therapists do
    # as_routes
    record_select_routes
  end
  resources :defect_causes do
    # as_routes
    record_select_routes
  end
  resources :doctor_donations do
    # as_routes
    record_select_routes
  end
  resources :donation_modes do
    # as_routes
    record_select_routes
  end
  resources :donation_types do
    # as_routes
    record_select_routes
  end
  resources :type_packings do
    # as_routes
    record_select_routes
  end
  resources :docs do
    # as_routes
    record_select_routes
  end
  resources :defect_orgs do
    # as_routes
    record_select_routes
  end
  resources :defect_skins do
    # as_routes
    record_select_routes
  end
  resources :org_inspects do
    # as_routes
    record_select_routes
  end

  root to: "rails_admin/main#dashboard"

end
