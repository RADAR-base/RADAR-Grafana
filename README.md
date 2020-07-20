# RADAR-Grafana

Grafana / TimescaleDB dashboard for RADAR data.

## Usage

To get started, copy the `.env.template` file to `.env`. It should contain the following variables, using passwords of your choosing:

```bash
# Set a strong passwords for the postgres database
POSTGRES_PASSWORD=myStrongPassword
POSTGRES_DB=grafana-metrics
# Set a password as value to log in to grafana.
GRAFANA_PASSWORD=myGrafanaPassword
GRAFANA_URL=http://localhost:3000/
```

Then, copy `docker/sink-timescale.properties.template` to `docker/sink-timescale.properties` and enter your database connection URL, username, and password.

Now you can run the stack using

```shell
docker-compose up -d --build
```

Grafana should now be available on <http://localhost:3000>.
