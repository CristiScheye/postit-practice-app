class ChangeVotes < ActiveRecord::Migration
  def change
  	change_table :votes do |t|
  		t.rename :votes, :vote
  	end
  end
end
