class FixturesController < ApplicationController
  def index
    @fixtures = Fixture.all

    respond_to do |format|
      format.html
      format.json do
        render json: @fixtures
      end
    end
  end
end
