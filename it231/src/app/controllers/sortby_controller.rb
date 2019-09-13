class SortbyController < ApplicationController
    @ratingz = ''
    @lineNumber = 1

  def srs
    @lineNumber = 1
    @ratingz = FinaleRating.order("series")
  end

  def vws
    @lineNumber = 1
    @ratingz = FinaleRating.order("viewership")
  end

  def hhr
    @lineNumber = 1
    @ratingz = FinaleRating.order("householdrating")
  end

  def net
    @lineNumber = 1
    @ratingz = FinaleRating.order("network")
  end
end
