# iCommands docker environment for iRODS

## Usage

1. Setup an `irods_environment.json` file in base folder. Look at [example](irods_environment.json.example).

2. Build Docker image
```bash
docker build --tag ucyo/icommands:18.04 .
```

3. Initiate and setup icommands once
```bash
docker run -it -v $(pwd):/home/irods-user/.irods/ --rm ucyo/icommands:18.04 iinit
```
afterwards any command can be executed either with an interactive session or by a simple run command.
