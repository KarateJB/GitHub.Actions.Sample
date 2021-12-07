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

### Build Docker Image

```s
$ docker build --no-cache -t karatejb/robot-sample -f ./docker/dockerfile .
$ docker push karatejb/robot-sample
```

```s
$ docker run -it --rm --shm-size=2gb karatejb/robot-sample sh
```

Or

```s
$ docker run -it --rm --shm-size=2gb -v C:\Users\ppipp\Documents\JB\Works\SourceControl\GitHub\KarateJB\Bank.Automation\src:/usr/src/rf karatejbacr.azurecr.io/robot-bank sh
```


To run tests...

```s
$ cd /usr/src/rf/tests
$ cd ClockInOut
$ robot clock_in.robot
$ robot clock_out.robot
```
or

```s
$ docker run -it --rm --shm-size=2gb karatejbacr.azurecr.io/robot-bank robot /usr/src/rf/tests/ClockInOut/clock_in.robot
$ docker run -it --rm --shm-size=2gb karatejbacr.azurecr.io/robot-bank robot /usr/src/rf/tests/ClockInOut/clock_out.robot
```