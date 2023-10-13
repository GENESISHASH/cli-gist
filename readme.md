# cli-gist

a simple command-line utility to create gists on github.

## installation

clone the repository and navigate to the project folder:

```bash
git clone https://github.com/GENESISHASH/cli-gist.git
cd cli-gist
```

install the required packages:

```bash
npm install
```

## usage

you can use this cli to create a gist from a file.

## env variables

you need to set your github username and token as environment variables:

```bash
export GITHUB_USERNAME=your_username
export GITHUB_TOKEN=your_token
```

### create a gist

to create a gist from a file, run:

```bash
./cli.sh <file>
```

### create a public gist

by default gists created are secret. to create a public gist, use the `-p` 
or `--public` option:

```bash
./cli.sh <file> -p
```

or:

```bash
./cli.sh <file> --public
```

