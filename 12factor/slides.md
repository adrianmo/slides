# Designing Cloud Native Applications

by *Adrian Moreno Martinez*

---

Pets vs Cattle

[IMG]

----

## Pets

- They are given names like Max, Rocky, Molly
- They are unique and lovely
- You care about them
- When they get ill, we heal them

----

## Cattle

- They are given names like vm0024, vm0183, ...
- They are almost identical to other cattle
- When they get ill, we get another one

----

<!-- .slide: data-background="img/pets_vs_cattle.png" data-background-size="85%" -->

---

1. People
2. Processes
3. Technology

----

People

----

Processes

----

Technology

---

Design Principles

1. Do one thing and do it well (e.g. linux pipelines)
2. Decouple the data
3. Keep the communication to a minimum
4. How will it perform and scale
5. Security is important

---

## 12 factors

I. Codebase
II. Dependencies
III. Config
IV. Backing services
V. Build, release, run
VI. Processes
VII. Port binding
VIII. Concurrency
IX. Disposability
X. Dev/prod parity
XI. Logs
XII. Admin processes

----

## I. Codebase

One codebase tracked in revision control, many deploys

### Why?

Deployments are automated

----

## II. Dependencies

Explicitly declare and isolate dependencies

### Why?

App is standalone and needs to install dependencies

----

## III. Config

Store config in the environment

### Why?

Data is separate from code to assist in automation

----

## IV. Backing services

Treat backing services as attached resources

### Why?

Allows changing of service without code changes

----

## V. Build, release, run

Strictly separate build and run stages

### Why?

Developers own build and release that Ops deploy and run

----

## VI. Processes

Execute the app as one or more stateless processes

### Why?

Scale out

----

## VII. Port binding

Export services via port binding

### Why?

Allows modularization and other apps to consume your services

----

## VIII. Concurrency

Scale out via the process model

#### Why?

Small defined apps allows scaling as need to handle load

----

## IX. Disposability

Maximize robustness with fast startup and graceful shutdown

### Why?

Changes need to take effect quickly

----

## X. Dev/prod parity

Keep development, staging, and production as similar as possible

### Why?

Continuous deployment requires same environment to reduce errors

----

## XI. Logs

Treat logs as event streams

### Why?

Logs are handled differently depending on the environment

----

## XII. Admin processes

Run admin/management tasks as one-off processes

### Why?

Live or long running apps will require it

---

<!-- .slide: data-background="img/continuous-integration.png" data-background-size="85%" -->

---

# FIN

adrianmo.github.io/slides/12factor
