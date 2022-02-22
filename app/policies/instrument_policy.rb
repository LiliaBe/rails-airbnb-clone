class InstrumentPolicy < ApplicationPolicy

  def create?
    return true
  end

  # def new?
  #   create?
  # end

  def update?
    record.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end

    # For a multi-tenant SaaS app, you may want to use:
    # scope.where(user: user)
  end
end
