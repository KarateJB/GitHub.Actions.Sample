## Get started

### 1. (Optional) Create a virtual environment

```s
$ python -m venv venv/dev
$ source venv/dev/Scripts/activate
```


### 2. Install requirements

```s
$ cd src
$ pip install -r requirements.txt
```

### 3. Set environment variables

For bash user,

```s
$ cd src/env
$ . init_env_vars.sh
```

### 4. Initialize credential resource file

The credential resource file is gitignored. Make sure you create one to store the credentials like following.

```s
$ touch src/env/local/credentials.robot
$ echo "*** Variables ***" > credentials.robot
$ echo "\${ID}    xxxxxx" >> credentials.robot
$ echo "\${PWD}    xxxxxx" >> credentials.robot
```

## Run on Docker

```s
$ docker build --no-cache -t robot-sample -f ./docker/dockerfile .
$ docker run -it --rm --shm-size=2gb robot-sample:latest sh
```