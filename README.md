# hubot-jira

Will post messages when the status of an issue has changed.


## Installation

In hubot project repo, run:

`npm install hubot-jira --save`

Then add **hubot-jira** to your `external-scripts.json`:

```json
["hubot-jira"]
```

## Sample Usage

Add the following URL as a build web hook in JIRA:

```
http://<ip>:<port>/jira?targets=room1,room2
```
