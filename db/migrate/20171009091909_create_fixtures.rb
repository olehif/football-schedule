class CreateFixtures < ActiveRecord::Migration[5.1]
  def change
    create_table :fixtures do |t|
      t.string :home_team_name
      t.string :away_team_name
      t.integer :football_data_id
      t.integer :home_team_score
      t.integer :away_team_score
      t.string :status
      t.datetime :date
      t.timestamps
    end
  end
end
