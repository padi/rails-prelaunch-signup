class AddConfirmableToUsers < ActiveRecord::Migration
  def change
    # These values will make :confirmable module work for Users model
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string

    # Simple way of adding a default confirmed_at to existing users
    # Not adding this will result in existing users to not be able to login
    User.update_all(:confirmed_at => Time.now)
  end
end
