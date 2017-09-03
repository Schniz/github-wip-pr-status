require 'sinatra'
require 'json'
require 'octokit'

GITHUB_TOKEN = ENV["GITHUB_TOKEN"]

before do
  @client ||= Octokit::Client.new(access_token: GITHUB_TOKEN)
end

post '/event_handler' do
  payload = JSON.parse(request.body.read)
  case request.env['HTTP_X_GITHUB_EVENT']
  when "pull_request"
    process_pull_request(payload["pull_request"])
  end
end

def is_wip?(pull_request)
  pull_request['title'].start_with?("WIP:")
end

def process_pull_request(pull_request)
  pr_status = is_wip?(pull_request) ? "pending" : "success"
  description = if is_wip?(pull_request)
                  "Title starts with `WIP:`: There is a work in progress"
                else
                  "Title doesn't start with `WIP:`: Ready to merge"
                end
  @client.create_status(pull_request['base']['repo']['full_name'],
                        pull_request['head']['sha'],
                        pr_status,
                        context: 'pr/wip',
                        description: description)
  "Okay"
end
