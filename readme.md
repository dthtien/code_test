# Simulator

## Prerequisites
- Ruby 3.4.4

## Installation

1. Clone the repository:
   ```bash
   git clone  git@github.com:dthtien/code_test.git
    cd code_test/simulator
    ```
2. Install dependencies:
    ```bash
    bundle install
    ```

3. Run the simulator:
    ```bash
    # Run with default test commands
    ruby ./bin/main.rb < test_data.txt
    # Manually input commands
    ruby ./bin/main.rb
    ```

4. To run the tests:
    ```bash
    bundle exec rspec
    ```

## Test Data
- The `test_data.txt` file contains a set of commands to test the simulator. You can modify this file to add or change
commands as needed.

