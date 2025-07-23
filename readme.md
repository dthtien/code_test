# Simulator

## Prerequisites
- Ruby 3.0 or higher(currently developed with Ruby 3.4.4)

## Installation

1. Install Ruby and Docker(optional):
   - For Ruby, follow the instructions at [Ruby Installation Guide](https://www.ruby-lang.org/en/documentation/installation/).
   - For Docker, follow the instructions at [Docker Installation Guide](https://docs.docker.com/get-docker/).

2. Clone the repository:
   ```bash
    git clone git@github.com:dthtien/code_test.git
    cd code_test
    ```
3. Install dependencies:

With Docker:
    ```bash
    docker build -t simulator .
    ```

Without Docker:
    ```bash
    bundle install
    ```

4. Run the simulator:

With Docker:
    ```bash
    # to run the simulator with default test commands
    docker run --rm -i seek_code ruby bin/main.rb < test_data.txt

    # to run the simulator and manually input commands
    docker run --rm -it seek_code
    ```
With Docker:
    ```bash
    # Run with default test commands
    ruby ./bin/main.rb < test_data.txt
    # Manually input commands
    ruby ./bin/main.rb
    ```

5. To run the tests:

With Docker:
    ```bash
    docker run --rm -it seek_code rspec
    ```
Without Docker:
    ```bash
    bundle exec rspec
    ```

## Test Data
- The `test_data.txt` file contains a set of commands to test the simulator. You can modify this file to add or change
commands as needed.

