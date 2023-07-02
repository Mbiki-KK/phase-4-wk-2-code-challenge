class PowersController < ApplicationController
  wrap_parameters format:[]

  def index
    powers = Power.all
    render json: powers
  end

  def show
    power = Power.find_by(id: params[:id])

    if power
      render json: power
    else
      render json: { error: "Power not found" }, status: :not_found
    end
  end

  def update
    power = Power.find_by(id: params[:id])

    if power
      if power.update(power_params)
        render json: power, status: :ok
      else
        render_error_validation
      end
    else
      render_error
    end
  end

  private

  def power_params
    params.permit(:description)
  end

  def render_error
    render json: {error: "Power not found"}, status: :not_found
  end

  def render_error_validation
    render json: {error: ["Validation error"]}, status: :unprocessable_entity
  end
end
