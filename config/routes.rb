Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match 'test-takers/list' => 'test_takers#index',
    via: [:options, :get]
end
