class InvitationsController < ApplicationController

  def create
    id1 = params[:ids][:id1]
    id2 = params[:ids][:id2]
    @invitation = Invitation.create(user_id: id1, friend_id: id2)
    redirect_to profile_path(id: current_user.profile.id) if @invitation.save
  end

  def destroy
    invitation = Invitation.find(params[:invitation_id])
    redirect_to profile_path(id: current_user.profile.id) if invitation.destroy
  end

  def edit; end

  def update
    invitation = Invitation.find(params[:invitation_id])
    redirect_to profile_path(current_user.profile.id) if invitation.update(confirmed: true)
  end
end
