class ListPolicy < Struct.new(:user, :list)
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(:show => true)
      end
    end

    def update?
      user.admin? or list.open
    end

    def show?
      user.admin? or list.viewable?
    end
  end
end
