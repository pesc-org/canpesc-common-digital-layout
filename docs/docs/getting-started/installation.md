---
sidebar_position: 1
---

# Installation

This guide is not intended to provide a comprehensive tour of Docker and its orchestrators. Rather, it's designed to
be concise enough to assist beginners in getting started while helping power users sidestep potential pitfalls.

:::danger

We do not recommend exposing your instances to the external world. In terms of security, you should consider PESC CDL API
as a database. i.e. don't expose it externally with ingress, but instead treat it as only reachable from within the virtual
network.

:::

## Docker

To start a default Docker container of pesc-cdl-api, run:

```
docker run --rm -p 4000:8080 ghcr.io/maldworth/canpesc-common-digital-layout/pesc-cdl-api:latest
```

:::info

The API will be available at http://localhost:4000.

:::

## Docker Compose

Incorporating PESC CDL API into your Docker Compose services stack is as straightforward as:

```yaml title="docker-compose.yml"
services:
  # Your other services.

  pesc-cdl-api:
    image: ghcr.io/maldworth/canpesc-common-digital-layout/pesc-cdl-api:latest
```

:::info


The API will be accessible at http://pesc-cdl-api:8080 within your Docker Compose network.
This means your other services can interact with PESC CDL API using http://pesc-cdl-api:8080.

:::

---

If you want to expose the API to your *localhost*, consider adding a `ports` section:

```yaml title="docker-compose.yml"
services:
  # Your other services.

  pesc-cdl-api:
    image: ghcr.io/maldworth/canpesc-common-digital-layout/pesc-cdl-api:latest
    ports:
      - "4000:8080"
```

:::info

The API will be available at http://localhost:4000.

:::

---

### PDF Support

PDF Configuration is optional and uses the open source (MIT licenced) [Gotenberg](https://gotenberg.dev/). You are always welcome to take the html output and
leverage your own html-to-pdf infrastructure if you already have it, but with a quick update to the docker-compose seen below, you can get a powerful pdf conversion
engine with gotenberg. Please [read their documentation](https://gotenberg.dev/docs/getting-started/introduction) if you want to learn more about it and customize it.

```yaml title="docker-compose.yml"
services:
  # Your other services.
  
  gotenberg:
    image: gotenberg/gotenberg:8

  pesc-cdl-api:
    image: ghcr.io/maldworth/canpesc-common-digital-layout/pesc-cdl-api:latest
    environment:
      - GotenbergSharpClient__ServiceUrl=http://gotenberg:3000
      - GotenbergSharpClient__HealthCheckUrl=http://gotenberg:3000/health
    ports:
      - "4000:8080"
```

You might be wondering "where did those environment variables come from?", well head on over to the [configuration](/docs/getting-started/configuration#pdf-conversion-to-pdf) section and learn about the different possible configurations available for PESC CDL API.