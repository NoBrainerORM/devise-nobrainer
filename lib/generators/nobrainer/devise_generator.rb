require 'rails/generators/named_base'
require 'generators/devise/orm_helpers'

module NoBrainer
  module Generators
    class DeviseGenerator < Rails::Generators::NamedBase
      include Devise::Generators::OrmHelpers

      def self.namespace
        super.gsub(/no_brainer/,'nobrainer')
      end

      def generate_model
        invoke "nobrainer:model", [name] unless model_exists? && behavior == :invoke
      end

      def inject_field_types
        inject_into_file model_path, migration_data, :after => "include NoBrainer::Document\n" if model_exists?
      end

      def inject_devise_content
        inject_into_file model_path, model_contents, :after => "include NoBrainer::Document\n" if model_exists?
      end

      def migration_data
<<RUBY
  ## Database authenticatable
  field :email,              :default => ""
  field :encrypted_password, :default => ""

  ## Recoverable
  field :reset_password_token
  field :reset_password_sent_at

  ## Rememberable
  field :remember_created_at

  ## Trackable
  field :sign_in_count,      :default => 0
  field :current_sign_in_at
  field :last_sign_in_at
  field :current_sign_in_ip
  field :last_sign_in_ip

  ## Confirmable
  # field :confirmation_token
  # field :confirmed_at
  # field :confirmation_sent_at
  # field :unconfirmed_email    # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,                  # Only if unlock strategy is :email or :both
  # field :locked_at
RUBY
      end
    end
  end
end
