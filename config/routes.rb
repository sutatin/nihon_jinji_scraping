Rails.application.routes.draw do
  get 'scrapings/:start/:end' => 'scrapings#index'
  get ':start/:end' => 'scrapings#index'
  root 'scrapings#index'
end
