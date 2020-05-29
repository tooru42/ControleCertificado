Rails.application.routes.draw do
  root to:"cursos#index"
  get "cursos/categorias", controller: 'cursos', action: 'categorias', to:"cursos#categorias", as: "categorias"
  get "cursos/visualizar_todos_cursos", controller: 'cursos', action: 'visualizar_todos_cursos', to:"cursos#visualizar_todos_cursos", as: "todos_cursos"
  get "cursos/cursos_categoria/:categoria", controller: 'cursos', action: 'cursos_categoria', to:"cursos#cursos_categoria", as: "cursos_categoria"
  post "cursos/upload_arquivo"
  resources :cursos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end