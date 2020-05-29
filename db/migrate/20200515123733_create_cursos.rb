class CreateCursos < ActiveRecord::Migration[5.2]
  def change
    create_table :cursos do |t|
      t.string :nome_curso
      t.string :categoria
      t.date :data_conclusao
      t.string :instituicao

      t.timestamps
    end
  end
end
