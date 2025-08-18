COMPOSE_FILES = docker-compose-lakehouse.yml docker-compose-kafka.yml docker-compose-spark.yml

.PHONY: all-up all-down lakehouse-up lakehouse-down kafka-up kafka-down spark-up spark-down spark-bash

all-up:
	docker-compose $(foreach f,$(COMPOSE_FILES),-f $(f)) up -d

all-down:
	docker-compose $(foreach f,$(COMPOSE_FILES),-f $(COMPOSE_FILES)) down

lakehouse-up:
	docker-compose -f docker-compose-lakehouse.yml up -d

lakehouse-down:
	docker-compose -f docker-compose-lakehouse.yml down

kafka-up:
	docker-compose -f docker-compose-kafka.yml up -d

kafka-down:
	docker-compose -f docker-compose-kafka.yml down

spark-up:
	docker-compose -f docker-compose-spark.yml up -d

spark-down:
	docker-compose -f docker-compose-spark.yml down

spark-bash:
	docker exec -it spark-master bash
