# frozen_string_literal: true

module MaintenancesHelper
  def owner_block
    Member.select(:block).distinct
  end
end
