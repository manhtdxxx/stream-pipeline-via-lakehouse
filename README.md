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

## 2.2 Pipeline

![Pipeline](readme/pipeline.png)

---

# 📂 3. Project Structure
```text
stream-pipeline-via-lakehouse/
│
├── init/                             
├── hive/
├── trino/                               
├── spark/
├── superset/                                                       
├── src/
│   ├── bronze/              
│   ├── silver/
│   ├── gold/
│   └── ...
├── readme/                        
├── docker-compose-lakehouse.yml   
├── docker-compose-spark.yml            
└── docker-compose-kafka.yml             
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
