package env

import "github.com/go-redis/redis/v8"

// jwt key
var JWTKey = []byte("")

var RedisOptions *redis.Options = &redis.Options{
	Addr:     "127.0.0.1:6379",
	Password: "",
	DB:       0,
}

// mongodb
var MongoURI = ""

// stripe
var StripeKey = ""
var StripePublicKey = ""
var StripeWebhookKey = ""
