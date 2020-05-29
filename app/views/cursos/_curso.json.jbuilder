json.extract! curso, :id, :nome_curso, :categoria, :data_conclusao, :instituicao, :created_at, :updated_at
json.url curso_url(curso, format: :json)
