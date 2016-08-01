Rails.application.routes.draw do
  get 'scrapings/:type/:start/:end' => 'scrapings#index'
  get ':type/:start/:end' => 'scrapings#index'
  root 'scrapings#index'
end
