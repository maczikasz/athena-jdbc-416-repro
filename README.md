# athena-jdbc-416-repro
Reproduction code of incorrect behaviour of the Athena JDBC driver

## Description

This repository contains a simple Java application that demonstrates the incorrect behaviour of the Athena JDBC driver when executing a query that does not return any results.

## Steps to reproduce

1. Clone this repository
2. Create the required resources in AWS using the terraform script in `/etc/terraform` (supply the region and profile as required)
3. Run the Java application with gradle: `./gradlew run` (change the profile in `App.java` if needed)
4. Observe the output as it will produce a HTTP 416 error
5. Run the same query in the Athena console and observe that it returns an empty result

