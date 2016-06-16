# hubot-jira-lc

Will post messages when the status of an issue has changed.


## Installation

In hubot project repo, run:

`npm install hubot-jira-lc --save`

Then add **hubot-jira-lc** to your `external-scripts.json`:

```json
["hubot-jira-lc"]
```

## Sample Usage

Add the following URL as a build web hook in JIRA:

```
http://<ip>:<port>/jira?targets=room1,room2
```

To trigger this webhook on workflow transition, see this guide here: https://confluence.atlassian.com/jirakb/how-to-use-a-webhook-with-a-custom-event-779160676.html
