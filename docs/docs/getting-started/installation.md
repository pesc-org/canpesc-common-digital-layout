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
docker run --rm -p 4000:4000 ghcr.io/maldworth/canpesc-common-digital-layout/pesc-cdl-api:latest
```

:::info

The API will be available at [http://localhost:4000](http://localhost:4000).

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


The API will be accessible at [pesc-cdl-api:4000](http://pesc-cdl-api:4000) within your Docker Compose network.
This means your other services can interact with PESC CDL API using [pesc-cdl-api:4000](http://pesc-cdl-api:4000).

:::

---

If you want to expose the API to your *localhost*, consider adding a `ports` section:

```yaml title="docker-compose.yml"
services:
  # Your other services.

  pesc-cdl-api:
    image: ghcr.io/maldworth/canpesc-common-digital-layout/pesc-cdl-api:latest
    ports:
      - "4000:4000"
```

:::info

The API will be available at [http://localhost:4000](http://localhost:4000).

:::

---

### PDF Support

Todo

```yaml title="docker-compose.yml"
services:
  # Your other services.
  
  gotenberg:
    image: gotenberg/gotenberg:8

  pesc-cdl-api:
    image: ghcr.io/maldworth/canpesc-common-digital-layout/pesc-cdl-api:latest
    ports:
      - "4000:4000"
```