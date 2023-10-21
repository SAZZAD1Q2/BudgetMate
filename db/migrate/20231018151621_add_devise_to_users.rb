class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      # Keep the email and encrypted_password fields as they are

      ## Recoverable
      unless column_exists?(:users, :reset_password_token)
        t.string :reset_password_token
      end
      unless column_exists?(:users, :reset_password_sent_at)
        t.datetime :reset_password_sent_at
      end

      ## Rememberable
      # Comment out the line below since "remember_created_at" is already part of the table
      # t.datetime :remember_created_at

      ## Trackable
      unless column_exists?(:users, :sign_in_count)
        t.integer :sign_in_count, default: 0, null: false
      end
      unless column_exists?(:users, :current_sign_in_at)
        t.datetime :current_sign_in_at
      end
      unless column_exists?(:users, :last_sign_in_at)
        t.datetime :last_sign_in_at
      end
      unless column_exists?(:users, :current_sign_in_ip)
        t.string :current_sign_in_ip
      end
      unless column_exists?(:users, :last_sign_in_ip)
        t.string :last_sign_in_ip
      end

      ## Confirmable
      # t.string :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
    end
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
