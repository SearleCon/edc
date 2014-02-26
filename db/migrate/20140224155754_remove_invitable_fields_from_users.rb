class RemoveInvitableFieldsFromUsers < ActiveRecord::Migration
  def change
    remove_columns :users, :invitation_token, :invitation_created_at, :invitation_sent_at,  :invitation_accepted_at, :invitation_limit, :invited_by_id, :invited_by_type
  end
end



