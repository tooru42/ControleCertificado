class CursosController < ApplicationController
  before_action :set_curso, only: [:show, :edit, :update, :destroy]

  # GET /cursos
  # GET /cursos.json
  def index
    @cursos = Curso.all
  end

  # GET /cursos/1
  # GET /cursos/1.json
  def show
  end

  # GET /cursos/new
  def new
    @curso = Curso.new
  end

  # GET /cursos/1/edit
  def edit
  end

  # POST /cursos
  # POST /cursos.json
  def create
    if params[:certificado] != nil
      upload_arquivo()
    end

    @curso = Curso.new(curso_params)
    @curso.certificado = params[:certificado].original_filename

    respond_to do |format|
      if @curso.save
        format.html { redirect_to @curso, notice: 'Curso criado com sucesso.' }
        format.json { render :show, status: :created, location: @curso }
      else
        format.html { render :new }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cursos/1
  # PATCH/PUT /cursos/1.json
  def update
    if params[:certificado] != nil
      upload_arquivo()
    end
    @curso = Curso.find(params[:id])
    unless params[:certificado].nil?
      @curso.certificado = params[:certificado].original_filename
    end

    respond_to do |format|
      if @curso.update(curso_params)
        format.html { redirect_to @curso, notice: 'Alterado curso com sucesso.' }
        format.json { render :show, status: :ok, location: @curso }
      else
        format.html { render :edit }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    @curso.destroy
    respond_to do |format|
      format.html { redirect_to todos_cursos_path, notice: 'Deletado curso com sucesso.' }
      format.json { head :no_content }
    end
  end

  def categorias
    @categorias = Curso.select('distinct(categoria)').order("categoria")
    render :categoria
  end

  def visualizar_todos_cursos
    @cursos = Curso.all.order("nome_curso")
    render :visualizar_todos_cursos
  end

  def cursos_categoria
    @categoria = params.require(:categoria)
    @cursos = Curso.where(categoria: @categoria)
    render :cursos_categoria
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curso
      @curso = Curso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def curso_params
      params.require(:curso).permit(:nome_curso, :categoria, :data_conclusao, :instituicao, :certificado)
    end

    def upload_arquivo
      # cria o caminho físico do arquivo
      path = File.join(Rails.root, 
        "public/certificados", 
        params[:certificado].original_filename)
  
        # escreve o arquivo no local designado
        File.open(path, "wb") do |f| 
          f.write(params[:certificado].read)
        end
    end
end
