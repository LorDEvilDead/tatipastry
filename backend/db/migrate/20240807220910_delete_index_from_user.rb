# frozen_string_literal: true

class DeleteIndexFromUser < ActiveRecord::Migration[7.1]
  def change
    remove_index 'users', column: [:email], name: 'index_users_on_email'
  end
end
