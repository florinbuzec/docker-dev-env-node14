help: ## View all make targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


stop: ## Stop the container stack
		@echo "Stopping all containers..."
		docker compose stop && docker compose down

build: ## Build the container stack
		@echo "Building containers..."
		docker compose build

start: ## Start the container stack
		@echo "Building and Starting up containers..."
		make build && docker compose up -d

start_debug: ## Start the container stack in debuging mode
		@echo "Building and Starting up containers..."
		docker compose build --progress=plain && docker compose up -d

clean: ## CLean out unused docker & docker-compose files
		@echo "Removing all cached steps... [safe]"
		docker builder prune

		@echo "Removing unused docker files... [danger]"
		@echo "Please uncomment the next line here in Makefile!"
#		docker system prune -af
