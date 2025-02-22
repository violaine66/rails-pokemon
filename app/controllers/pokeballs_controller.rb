class PokeballsController < ApplicationController
  def create
    @pokemon = Pokemon.find(params[:pokemon_id])
    @trainer = Trainer.find(pokeball_params[:trainer_id])
    @pokeball = Pokeball.new(pokeball_params)
    @pokeball.pokemon = @pokemon
    @pokeball.trainer = @trainer
    chance = [1, 2].sample
    should_save = chance == 1
    if should_save == false
      redirect_to trainer_path(@trainer),  notice: " You're just miss it! It got away" and return
    end
    if  @pokeball.save
        redirect_to trainer_path(@trainer), notice: "Congratulations! Pokemon catched!"
    else
      render "pokemons/show", notice: "error"
    end
  end


    def destroy
      @pokeball = Pokeball.find(params[:id])
      @pokeball.destroy
      redirect_to trainer_path(@pokeball.trainer), status: :see_other
    end


  private
  def pokeball_params
    params.require(:pokeball).permit(:location, :caught_on, :trainer_id)
  end
end
