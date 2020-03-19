# frozen_string_literal: true

class PaymentRecord < ApplicationRecord
  belongs_to :member
end
