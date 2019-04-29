class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    @user.present?
  end

  def create?
    @user.present?
  end

  def show?
    true
  end

  def edit?
    @user.present?
  end

  def update?
    @user.present?
  end

  def destroy?
    @user.present?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
