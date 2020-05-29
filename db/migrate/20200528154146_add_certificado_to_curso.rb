class AddCertificadoToCurso < ActiveRecord::Migration[5.2]
  def change
    add_column :cursos, :certificado, :string
  end
end
