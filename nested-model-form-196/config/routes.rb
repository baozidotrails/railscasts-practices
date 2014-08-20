Rails.application.routes.draw do
  get '/', to: redirect('/surveys')
  resources :surveys
end
