# 📑 Table of Contents

- [📌 1. Introduction](#-1-introduction)
- [🏗 2. Architecture](#-2-architecture)
- [📂 3. Project Structure](#-3-project-structure)
- [🚀 4. Setup](#-4-setup)

---

# 📌 1. Introduction
This project's still ongoing.

---

# 🏗 2. Architecture

## 2.1 Lakehouse

![Lakehouse Architecture](readme/lakehouse.png)

**Test creating a table using Trino in DBeaver:**

![Trino Test](readme/trino-example.png)

**Check the result on MinIO:**

![MinIO Result](readme/table-format.png)

## 2.2 Pipeline

![Pipeline](readme/pipeline.png)

---

# 📂 3. Project Structure
```text
stream-pipeline-via-lakehouse/
│
├── init/                              # Initialization scripts
├── hive/                              # Hive metastore configuration + Dockerfile
├── trino/                             # Trino configuration
├── spark/                             # Spark configuration + Dockerfile
├── superset/                          # Superset configuration + Dockerfile
│
├── src/                               # ETL source code following the medallion architecture
│   ├── bronze/                          # Bronze layer – raw ingested data from Kafka
│   ├── silver/                          # Silver layer – cleaned, standardized, and enriched data
│   ├── gold/                            # Gold layer – aggregated, analytics-ready data for BI/ML
│   └── ...                           
│
├── readme/                            # Documentation, diagrams, notes
│
├── docker-compose-lakehouse.yml       # Docker Compose for the Lakehouse stack (MinIO, Hive, Postgres, Trino), and Superset
├── docker-compose-spark.yml           # Docker Compose for Spark cluster
└── docker-compose-kafka.yml           # Docker Compose for Kafka cluster, and Kafka UI

```

---

# 🚀 4. Setup

## 4.1 Prerequisites

Before starting, please ensure you have:

- Docker Desktop installed and running.
- VS Code installed to open project.
- DBeaver installed to connect to Trino to write SQL.

## 4.2 Setup & Initialization

## 4.3 Run the pipeline
