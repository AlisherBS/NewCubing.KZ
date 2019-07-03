class AddAnnouncedAtToCompetitions < ActiveRecord::Migration[5.1]
  def change
    add_column :competitions, :announced_at, :datetime
  end
end
