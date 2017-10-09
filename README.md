# Setup:

1. Clone repo
2. Run migrations
2. Create .env file with 'football-data.org' api key:
```
FOOTBALLDATA_API_KEY = "your_api_key"
```
3. Update crontab:
```
whenever --update-crontab
```
4. Manually sync for the first time:
```
# In ruby cli
FixturesSynchronizer.new.call
```
