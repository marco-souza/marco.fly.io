package config

import (
	"os"

	"github.com/joho/godotenv"
)

type Config struct {
	Hostname    string
	Port        string
	Env         string // development | production
	DatabaseUrl string
}

func Load() *Config {
	// load .env file
	godotenv.Load()

	return &Config{
		Hostname:    env("HOST", "localhost"),
		Port:        env("PORT", "3001"),
		Env:         env("ENV", "development"),
		DatabaseUrl: env("DB_URL", "./test.db"),
	}
}

func env(varEnv string, defaultValue string) string {
	value := os.Getenv(varEnv)
	if value != "" {
		return value
	}
	return defaultValue
}
