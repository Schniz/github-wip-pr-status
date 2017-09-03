# WIP Pull Requests in GitHub [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/heroku/node-js-sample&env[GITHUB_TOKEN]=your_personal_access_token_to_github)

Just start your PR title with `WIP:` and you'll get a pending status

![Pending status](./docs/wip.png)

Remove the `WIP:` and you'll get a success status

![Success status](./docs/no-wip.png)

this is all

## Usage
- clone
- deploy to Heroku [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/heroku/node-js-sample&env[GITHUB_TOKEN]=your_personal_access_token_to_github)
- set `GITHUB_TOKEN` to your personal (or bot) github access token
- set a webhook for `Pull Requests` only to `https://YOUR_APP.herokuapp.com/event_handler`
