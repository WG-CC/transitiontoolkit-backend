# Prerequisites

Install Python from the [python website](https://www.python.org/downloads/)
Install `make` command for cli if not already part of the system following these steps:

1. Install chocolatey from [here](https://chocolatey.org/install).
2. Then `choco install make`

# Setup

## 1. Install dependencies

Run the following command:

```sh
make install
```

This will create venv file and install the dependencies.

## 2. Setting up the Database

## 3. Run the API

Run the following command:

```sh
make runserver
```

## 4. Update the requirements.txt file

If you add a new dependency on your branch run the following command:

```sh
make freeze
```

# How to Debug your code

# How to Test your code

<details>
  <summary> Running test with ...</summary>
