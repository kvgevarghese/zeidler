Rails.application.routes.draw do
  resources :documents
  root to: "memos#index"
  resources :memos do
    collection do
       get 'download'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
