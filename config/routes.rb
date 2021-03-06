Rails.application.routes.draw do
  resources :zones

  resources :towns

  resources :sectors

  resources :quadrants

  resources :provinces

  resources :leaders

  resources :phones

  resources :person_quadrant_link_kinds

  resources :person_person_relations

  resources :person_addresses

  resources :people_relation_kinds

  resources :people do
    collection do
      get :autocomplete
      get :autocomplete_for_zone
      get :autocomplete_for_action_zone
      get :autocomplete_for_conceptualization
      get :autocomplete_for_leader
    end
  end

  resources :investigations

  resources :investigation_statuses

  resources :investigation_categories

  resources :identifications

  resources :identification_types

  resources :countries

  resources :conceptualizations

  resources :cities

  resources :attaches

  resources :attach_types

  resources :addresses

  resources :address_sector_relations

  resources :address_link_kinds

  resources :action_zones

  resources :attach_details

  devise_for :users

  resources :users do
    member do
      get :edit_profile
      patch :update_profile
    end
  end

  root to: redirect('/users/sign_in')
end
