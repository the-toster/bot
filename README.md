# echo bot
## How to run bot

### Run from sources
Clone this repo
```shell script
git clone git@github.com:the-toster/echo-bot.git
```

Go to corresponding directory
```shell script
cd echo-bot
```

Run build command
```shell script
stack build
```

Run bot
```shell script
stack exec bot-exe
```

### Configuration
Bot configured by setting environment variables, see `.env.example` for reference.  
You can also create `.env` file (`cp .env.example .env`) to store your config.


### Running tests
```shell script
stack test
```

