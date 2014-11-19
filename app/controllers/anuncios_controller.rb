class AnunciosController < ApplicationController
  before_filter :usuario_autorizado, only: [:new, :create]
  before_action :set_anuncio, only: [:show, :edit, :update, :destroy, :edit, :update, :destroy]
 

  # GET /anuncios
  # GET /anuncios.json
  def index
    @anuncios = Anuncio.all.paginate(page: params[:page], per_page: 4 )

    respond_to do |format|
      format.html
      format.json { render json: @jobs }
    end
  end
				#Client.where("orders_count = ?", params[:orders])
	def busca
		@anuncios = Anuncio.where("descricao LIKE :filtro OR titulo LIKE :filtro OR categoria LIKE :filtro", {:filtro => "%#{params[:filtro]}%"})
	end

	def meuanuncio
		@anuncios = current_user.anuncios
	end


  def favorito
    @anuncios = Anuncio.where(favorito: true).order("created_at DESC").all.paginate(page: params[:page], per_page: 4)
  end

  def categoria
    @anuncios = Anuncio.where("categoria LIKE :categoria", {:categoria => "%#{params[:categoria]}%"})
  end

  # GET /anuncios/1
  # GET /anuncios/1.json
  def show
    @anuncio = Anuncio.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @anuncio }
    end
  end

  # GET /anuncios/new
  def new
    @anuncio = current_user.anuncios.build

    respond_to do |format|
      format.html
      format.json { render json: @anuncio }
    end
  end

  # GET /anuncios/1/edit
  def edit
    @anuncio = current_user.anuncios.find(params[:id])
  end

  # POST /anuncios
  # POST /anuncios.json
  def create
    @anuncio = current_user.anuncios.build(anuncio_params)

    respond_to do |format|
      if @anuncio.save
        format.html { redirect_to @anuncio, notice: 'Anuncio criado com sucesso.' }
        format.json { render :show, status: :created, location: @anuncio }
      else
        format.html { render :new }
        format.json { render json: @anuncio.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # PATCH/PUT /anuncios/1
  # PATCH/PUT /anuncios/1.json
  def update
    @anuncio = current_user.anuncios.find(params[:id])


    respond_to do |format|
      if @anuncio.update(anuncio_params)
        format.html { redirect_to @anuncio, notice: 'Anuncio atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @anuncio }
      else
        format.html { render :edit }
        format.json { render json: @anuncio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anuncios/1
  # DELETE /anuncios/1.json
  def destroy
    @anuncio = current_user.anuncios.find(params[:id])
    @anuncio.destroy
    
    respond_to do |format|
      format.html { redirect_to anuncios_url, notice: 'Anuncio excluido.' }
      format.json { head :no_content }
    end
  end

    def set_anuncio
      @anuncio = Anuncio.find(params[:id])
    end

     def anuncio_params
      params.require(:anuncio).permit(:descricao, :preco, :titulo, :imagem, :favorito, :categoria, :user_id)
    end

    private 

    def usuario_autorizado
      unless current_user
        redirect_to root_path
      end
    end    
    
end

