class FavoritePolicy < ApplicationPolicy
  def index?
    owner?
  end

  def show?
    owner?
  end

  def create?
    true
  end

  def destroy?
    owner?
  end

  private

  def owner?
    user.favorites.includes(record)
  end

  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end
end
