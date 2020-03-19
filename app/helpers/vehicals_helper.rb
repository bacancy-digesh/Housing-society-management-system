# frozen_string_literal: true

module VehicalsHelper
  def owner_block
    Member.select(:block).distinct
  end

  def owner_house
    Member.select(:house_no).distinct
  end

  def vehicals
    Vehical.all
  end
end
