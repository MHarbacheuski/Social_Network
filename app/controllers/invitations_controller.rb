# frozen_string_literal: true

class InvitationsController < ApplicationController
  def create
    friend = params[:ids][:id2]
    @invitation = current_user.invitations.create(friend_id: friend)
    @invitation.save
    redirect_to profile_path(id: current_user.profile.id)
  end

  def destroy
    invitation = Invitation.find(params[:invitation_id])
    invitation.destroy
    redirect_to profile_path(id: current_user.profile.id)
  end

  def edit; end

  def update
    invitation = Invitation.find(params[:invitation_id])
    invitation.update(confirmed: true)
    redirect_to profile_path(current_user.profile.id)
  end
end
