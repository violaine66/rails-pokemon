class PokemonsController < ApplicationController
  def index
    if params[:search].present?
      @pokemons =  Pokemon.where("name ILIKE ?", "%#{params[:search]}%")
    else
      @pokemons = Pokemon.all
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def search
    search_query = params[:search][:query]
    if search_query.present?
      @pokemons =  Pokemon.where("name ILIKE ?", "%#{search_query}%")
    else
      @pokemon = Pokemon.all
    end
    redirect_to pokemons_path(search: search_query)
  end

  private
  def search_params
    params.require(:search).permit(:query)
  end

end
