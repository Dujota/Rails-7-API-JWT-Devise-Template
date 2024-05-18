# frozen_string_literal: true

# This module habndles all the user authority related methods
module UserAuthority
  extend ActiveSupport::Concern

  VALID_ROLES = [
    { label: 'Admin', value: 'admin' },
    # { label: "HR Admin", value: "hr_admin" },
    { label: 'Team Member', value: 'team_member' },
    # { label: 'Product Editor', value: 'product_editor' },
    { label: 'Regular', value: 'regular' }
  ].freeze

  # User Authority Methods
  def role_names
    roles.map(&:name)
  end

  def admin?
    is_role_by_name?(:admin)
  end

  # def is_hr_admin?
  #   is_role_by_name?(:hr_admin)
  # end

  def team_member?
    is_role_by_name?(:team_member)
  end

  # def product_editor?
  #   is_role_by_name?(:product_editor)
  # end

  def regular?
    roles.empty?
  end

  def role?(role)
    roles.include?(role)
  end

  def role_by_name?(role_name)
    if role_name == 'regular'
      is_regular?
    else
      roles.include?(Role.find_by_name(role_name))
    end
  end

  def add_role(role)
    roles << role
  end

  def add_role_by_role_name(role_name)
    roles << Role.find_by_name(role_name)
  end
end
