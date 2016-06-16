# Description
#   JIRA web hook
#
# Usage:
#   http://<ip>:<port>/jira?targets=room1,room2
#
#
# Author:
#   Kelvin Chan[kchan@sdelements.com]

url = require 'url'
querystring = require 'querystring'

module.exports = (robot) ->

    debug = process.env.JIRA_DEBUG?

    robot.router.post "/jira", (req, res) ->
        jiraChannel = process.env.JIRA_CHANNEL or "#jira"

        query = querystring.parse(url.parse(req.url).query)
        hook = req.body

        if !hook || !(hook.changelog.items[0].field == "status")
            res.end ""
            return

        envelope = {}
        envelope.room = if query.targets then query.targets else jiraChannel
        envelope.type = query.type if query.type

        latest_change = hook.changelog.items[0]
        message = "#{hook.user.displayName} has changed the status of ##{hook.issue.key} from '#{latest_change.fromString}' to '#{latest_change.toString}'"
        link = hook.issue.self

        robot.send envelope, message
        robot.send envelope, link

        debug && console.log(envelope, query, hook)

        res.end ""
