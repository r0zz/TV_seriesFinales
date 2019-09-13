class FinaleRatingsController < ApplicationController
  before_action :set_finale_rating, only: [:show, :edit, :update, :destroy]

  # GET /finale_ratings
  # GET /finale_ratings.json
  def index
    @finale_ratings = FinaleRating.all
  end

  # GET /finale_ratings/1
  # GET /finale_ratings/1.json
  def show
  end

  # GET /finale_ratings/new
  def new
    @finale_rating = FinaleRating.new
  end

  # GET /finale_ratings/1/edit
  def edit
  end

  # POST /finale_ratings
  # POST /finale_ratings.json
  def create
    @finale_rating = FinaleRating.new(finale_rating_params)

    respond_to do |format|
      if @finale_rating.save
        format.html { redirect_to @finale_rating, notice: 'Finale rating was successfully created.' }
        format.json { render :show, status: :created, location: @finale_rating }
      else
        format.html { render :new }
        format.json { render json: @finale_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /finale_ratings/1
  # PATCH/PUT /finale_ratings/1.json
  def update
    respond_to do |format|
      if @finale_rating.update(finale_rating_params)
        format.html { redirect_to @finale_rating, notice: 'Finale rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @finale_rating }
      else
        format.html { render :edit }
        format.json { render json: @finale_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finale_ratings/1
  # DELETE /finale_ratings/1.json
  def destroy
    @finale_rating.destroy
    respond_to do |format|
      format.html { redirect_to finale_ratings_url, notice: 'Finale rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_finale_rating
      @finale_rating = FinaleRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def finale_rating_params
      params.require(:finale_rating).permit(:series, :viewership, :householdrating, :share, :date, :network)
    end
end
