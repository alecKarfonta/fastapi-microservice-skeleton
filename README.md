# FastAPI Docker Skeleton Project

This project provides a skeleton for quickly deploying Python functionality as an API microservice using FastAPI and Docker.

## Project Structure

```
project/
├── app/
│   ├── __init__.py
│   ├── main.py
│   └── models.py
├── tests/
│   └── test_main.py
├── scripts/
│   ├── build.sh
│   ├── run.sh
│   └── start.sh
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
└── README.md
```

## Getting Started

1. Clone this repository:
   ```
   git clone https://github.com/alecKarfonta/fastapi-microservice-skeleton
   cd fastapi-microservice-skeleton
   ```

2. Build the Docker image:
   ```
   ./scripts/build.sh
   ```

3. Run the Docker container:
   ```
   ./scripts/run.sh
   ```

   Alternatively, you can use docker-compose:
   ```
   docker-compose up --build
   ```

4. If you need to start the application manually or want to see detailed startup information, use:
   ```
   ./scripts/start.sh [optional_log_file_path]
   ```

5. Access the API at `http://localhost:8400`

6. View the API documentation at `http://localhost:8400/docs`

## Scripts

- `build.sh`: Builds the Docker image for the application.
- `run.sh`: Runs the Docker container.
- `start.sh`: Starts the application, providing detailed startup information and logging. This script can be used both inside and outside of a Docker container.

## API Endpoints

- `GET /`: Welcome message
- `GET /items`: Retrieve all items
- `GET /items/{item_id}`: Retrieve a specific item
- `POST /items`: Create a new item
- `PUT /items/{item_id}`: Update an existing item
- `DELETE /items/{item_id}`: Delete an item

## Development

To add new functionality:

1. Modify `app/main.py` to add new routes and logic
2. Update `app/models.py` if you need to define new data models
3. Add tests in the `tests/` directory

## Running Tests

To run tests, execute the following command:

```
docker-compose run app pytest
```

## Deployment

To deploy this microservice:

1. Ensure you have Docker installed on your server
2. Clone this repository on your server
3. Run `./scripts/build.sh` to build the Docker image
4. Run `./scripts/run.sh` to start the service

For manual startup or troubleshooting, you can use `./scripts/start.sh`.

Remember to update the `ENVIRONMENT` variable in `docker-compose.yml` for production deployments.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License.