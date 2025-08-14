COMPOSE_FILES = docker-compose-lakehouse.yml docker-compose-kafka.yml docker-compose-spark.yml

.PHONY: all-up all-down

all-up:
	docker-compose $(foreach f,$(COMPOSE_FILES),-f $(f)) up -d

all-down:
	docker-compose $(foreach f,$(COMPOSE_FILES),-f $(f)) down

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