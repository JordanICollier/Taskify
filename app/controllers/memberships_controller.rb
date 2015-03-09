class MembershipsController < ApplicationController

  def index
    @memberships = Membership.all
    @membership = Membership.new
  end

  def new
    @membership = Membership.new
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
