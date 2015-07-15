# syslog-ng cloud logging demo

A docker container that logs 'hello world' to [Logentries](https://logentries.com/), [Loggly](https://www.loggly.com/) & [Papertrail](https://papertrailapp.com/). It's use is it's a working syslog-ng sandbox, you can quickly start sending messages in order compare these cloud log services.

## Requirements
Docker Machine, Docker Compose, accounts with each provider (with any necessary tokens/endpoints set up).

## Usage
* configure tokens etc by setting env vars

```
    LOGENTRIES_TOKEN
	LOGGLY_TAG
	LOGGLY_TOKEN
	PAPERTRAIL_HOST
	PAPERTRAIL_PORT
```

* `docker-compose build`
* `docker-compose up -d`
* `docker exec -it syslogngloggingdemo_log_1 tail -f /var/log/syslog`

To remove container when finished `docker-compose kill; docker-compose rm --force`

To change the message edit `etc/service/log-hello-world/run` (the `exec` is important, don't remove it). Each provider has it's own template, to edit/set tags etc edit `custom.conf`.

## Contributions
Are very welcome. To add a provider, improve the configuration somehow or any other change, please send a pull request.
