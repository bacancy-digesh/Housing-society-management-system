# frozen_string_literal: true

class MaintenancesController < ApplicationController
  def maintenance_detail
    @member = Member.where(block: params[:owner_block])
    @owner_block = Member
    member_ids = []

    @member.each do |member|
      member_ids.push(member.id)
    end
    @maintenance_detail = PaymentRecord.where(member_id: member_ids)
    render json: { owner: @member, maintenance_detail: @maintenance_detail }
  end

  def update_paymet_status
    owner_id = params[:owner_ids]
    maintenance_detail = PaymentRecord.where(member_id: owner_id.values)

    maintenance_detail.each do |detail|
      detail.status = true
      detail.save
    end
    flash[:notice] = 'Data save'
    redirect_to maintenances_path
  end
end
