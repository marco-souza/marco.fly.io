all: install run

install:
	go install github.com/cosmtrek/air@latest && \
	go install golang.org/x/tools/gopls@latest && \
	go install github.com/marco-souza/hooker@latest && hooker init

run: cmd/server/main.go
	air

deploy: ./fly.toml
	pkgx fly deploy --now -y

release: cmd/server/main.go
	CGO_CFLAGS="-D_LARGEFILE64_SOURCE" CGO_ENABLED=1 go build -ldflags "-s -w" -o ./build/server ./cmd/server/main.go

fmt:
	go fmt ./... && npx prettier -w views ./README.md ./docker-compose.yml

t: test
test: ./tests/
	go test -v ./...

encrypt: .env
	gpg -c .env

decrypt: .env.gpg
	gpg -d .env.gpg > .env
