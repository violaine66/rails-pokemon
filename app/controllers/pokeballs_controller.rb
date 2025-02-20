class PokeballsController < ApplicationController
  # def new
  #   @pokeball = Pokeball.new
  # end

  def create
    @pokemon = Pokemon.find(params[:pokemon_id])
    @trainer = Trainer.find(pokeball_params[:trainer_id])
    @pokeball = Pokeball.new(pokeball_params)
    @pokeball.pokemon = @pokemon
    @pokeball.trainer = @trainer
    if @pokeball.save
      redirect_to trainer_path(@trainer)
    else
      redirect_to pokemons_path, status: :unprocessable_entity
    end
  end

  private
  def pokeball_params
    params.require(:pokeball).permit(:location, :caught_on, :trainer_id)
  end
end
