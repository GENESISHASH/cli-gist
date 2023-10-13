log = console.log

commander = require 'commander'
axios = require 'axios'
fs = require 'fs'

{GITHUB_USERNAME, GITHUB_TOKEN} = process.env

if !GITHUB_USERNAME or !GITHUB_TOKEN
  if fs.existsSync(dotfile = require('os').homedir() + '/.gitclirc')
    [GITHUB_USERNAME, GITHUB_TOKEN] = fs.readFileSync(dotfile, 'utf8').trim().split ':'

if !GITHUB_USERNAME or !GITHUB_TOKEN
  throw new Error 'env.GITHUB_USERNAME and env.GITHUB_TOKEN noexists'


commander
  .arguments '<file>'
  .option '-p, --public', 'make the gist public'
  .action (file, options) -> upload_gist file, options.public

upload_gist = (file, is_public = false) ->
  try
    content = fs.readFileSync(file, 'utf8')
  catch e
    throw new Error e

  payload =
    public: is_public
    files: {}

  payload.files[file] = { content: content }

  axios.post 'https://api.github.com/gists',
    payload,
    auth:
      username: GITHUB_USERNAME
      password: GITHUB_TOKEN
  .then (r) ->
    log r.data.html_url
  .catch (e) ->
    throw new Error e

commander.parse process.argv

