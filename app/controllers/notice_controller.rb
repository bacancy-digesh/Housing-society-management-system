# frozen_string_literal: true

class NoticeController < ApplicationController
  def send_notice
    users = Member.all
    users.each do |u|
      NoticeMailer.notice(u, params[:subject], params[:message]).deliver_now
    end
    flash[:notice] = 'Notice Send'
    redirect_to new_notice_path
  end
end
