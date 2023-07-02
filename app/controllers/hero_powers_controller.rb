class HeroPowersController < ApplicationController
  def create
    hero_power = HeroPower.new(hero_power_params)
    # render json: heroes, only: [:id, :name, :super_name]
    if hero_power.save
      render json: hero_power.hero
    else
      error
    end
  end

  private

  def hero_power_params
    params.require(:hero_power).permit(:strength, :hero_id, :power_id)
  end

  def error
    render json: {error: ["Validation error"]}
  end


  # def show
  #   hero = Hero.find_by(id: params[:id])

  #   if hero
  #     render json: hero, include: { powers: {only: [:id, :name, :description]}}
  #   else
  #     render json: { error: "Hero not found" }, status: :not_found
  #   end
  # end
end
