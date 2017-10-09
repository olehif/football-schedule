class FixturesSynchronizer
  def call
    sync_fixtures('n5')
    sync_fixtures('p5')
  end

  def sync_fixtures(date)
    Footballdata.new.fixtures(date)[3][1].each do |fixture|
      fixture_id = fixture['_links']['self']['href'].split('/').last.to_i
      internal_fixture = Fixture.find_by(football_data_id: fixture_id)

      if internal_fixture
        update_fixture(fixture, internal_fixture)
      else
        create_fixture(fixture, fixture_id)
      end
    end
  end

  def create_fixture(fixture, fixture_id)
    Fixture.create(fixture_hash(fixture).merge({
      football_data_id: fixture_id
    }))
  end

  def update_fixture(fixture, internal_fixture)
    internal_fixture.update(fixture_hash(fixture))
  end

  def fixture_hash(fixture)
    {
      home_team_name: fixture['homeTeamName'],
      away_team_name: fixture['awayTeamName'],
      home_team_score: fixture['result']['goalsHomeTeam'],
      away_team_score: fixture['result']['goalsAwayTeam'],
      status: fixture['status'],
      date: Time.parse(fixture['date'])
    }
  end
end
