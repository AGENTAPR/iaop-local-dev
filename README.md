# iaop-local-dev

Local development infrastructure using Docker Compose, PostgreSQL, Keycloak, Flowable, and event broker.

## Purpose

iaop-local-dev is part of the **Insurance Agent Operating Platform (IAOP)**, an enterprise
insurance agent lifecycle platform. It owns the **Local Development Environment** bounded context
(or platform capability) within the IAOP microservices landscape.

## Bounded Context / Ownership

- **Bounded context:** Local Development Environment
- **Owner:** AGENTAPR
- **Category:** infrastructure

## Technical Stack

Docker Compose, PostgreSQL, Keycloak, Flowable, Kafka/RabbitMQ

## Architecture Principles

- Domain-Driven Design (DDD) with explicit bounded contexts
- Hexagonal architecture (ports and adapters)
- Event-driven integration via versioned contracts
- PostgreSQL as the system of record where applicable
- Identity and access via Keycloak
- Workflow orchestration via Flowable BPM where applicable

## Responsibilities

- Local development environment orchestration
- Docker Compose service definitions
- Local PostgreSQL, Keycloak, Flowable, and event broker setup

## Non-Responsibilities

- Production infrastructure
- Application service code
- CI/CD pipeline definitions

## Related Repositories

- [iaop-architecture](https://github.com/AGENTAPR/iaop-architecture) - DDD strategic design, bounded context maps, ADRs
- [iaop-api-contracts](https://github.com/AGENTAPR/iaop-api-contracts) - Versioned OpenAPI contracts
- [iaop-event-contracts](https://github.com/AGENTAPR/iaop-event-contracts) - Versioned integration events
- [iaop-workflow-service](https://github.com/AGENTAPR/iaop-workflow-service) - Flowable BPM orchestration
- [iaop-local-dev](https://github.com/AGENTAPR/iaop-local-dev) - Local development environment

## Status

**INITIALIZED - NOT IMPLEMENTED**

This repository has been bootstrapped with baseline documentation and configuration only.
No business logic or service implementation exists yet.

## Development Conventions

- Default branch: `main`
- Development branch: `development` — all changes are committed and pushed here
- Squash merges preferred; merge commits and rebases disabled
- Pull requests required before merging into `main`
- Topics: iaop, insurance, insurance-agents, enterprise-architecture, devops, docker, docker-compose, local-development, postgresql, keycloak
## Foundation implementation (2026-11)

- `docker-compose.yml` — postgres:17, keycloak:26 (realm auto-import), flowable-rest:7.1, otel-collector (profile `observability`)
- `initdb/01-create-databases.sql` — creates `iaop_<service>` database per service
- `keycloak/iaop-realm.json` — `iaop` realm with `iaop-api` client and roles `agent`, `agency-admin`, `ops`
- `.env.example` — local-only placeholder values (no real secrets)
- `.github/workflows/main-ci.yml` — compose/JSON/SQL validation on `main` pushes only
