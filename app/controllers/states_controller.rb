class StatesController < ApplicationController
	before_action :set_state, only: [ :edit, :update, :destroy, :show]
  # before_ action : authenticate_ user !, except: [:index, :show]
  # before_ action :require_ admin, except: [:index, :show]

	def index
		@states = State.all
	end

	def show
		@state_towns = @state.towns.all
		# @state_locations = @state.locations.all
		# @starter = @state_locations.first

		# @locations = if params[:l]
	 #    sw_lat, sw_lng, ne_lat, ne_lng = params[:l].split(",")
	 #    center   = Geocoder::Calculations.geographic_center([[sw_lat, sw_lng], [ne_lat, ne_lng]])
	 #    distance = Geocoder::Calculations.distance_between(center, [sw_lat, sw_lng])
	 #    box      = Geocoder::Calculations.bounding_box(center, distance)
	 #    Location.within_bounding_box(box)
	 #  elsif params[:near]
	 #    Location.near(params[:near])
	 #  else
	 #    @state_locations
		# end
	end

	def new
    @state = State.new
	end

	def create
    @state = State.new(state_params)
    if @state.save
      flash[:success] = "State was successfully created"
      redirect_to state_path(@state)
    else
      render 'new'
    end
	end

	def edit
	end

	def update
		if @state.update(state_params)
		  flash[:success] = "State was updated successfully"
      redirect_to state_path(@state)
		else
		  render 'edit'
		end
	end

	def destroy
		State.find(params[:id]).destroy
  	flash[:success] = "State was successfully deleted!"
    redirect_to states_path
	end

	private
		def set_state
			@state = State.friendly.find(params[:id])
		end

		def state_params
      params.require(:state).permit(:name, :abv)
    end

    #  def require_admin
	  #   if !current_user.admin?
		 #    flash[:danger] = "Only admin users can perform that action"
			#   redirect_to states_path
		 #  end
	  # end
end







