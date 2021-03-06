# Created on Fri Aug 30, 2019
# A subclass and its super class can share the same name.

class ApplicationPolicy
  class Scope
    attr_reader :admin, :scope

    def initialize(admin, scope)
      @admin = admin
      @scope = scope
    end

    def resolve
      puts "scope.all in ApplicationPolicy"
    end
  end
end

class PostPolicy < ApplicationPolicy
  # Inheriting from the application policy scope generated by the generator
  class Scope < Scope
    def resolve
      puts "The admin is a VIP in PostPolicy"
    end
  end
end

ap = ApplicationPolicy::Scope.new(nil, nil)
ap.resolve

pps = PostPolicy::Scope.new(nil, nil)
pps.resolve
