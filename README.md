# Docker WordPress Setup with NGINX and MariaDB

This project demonstrates a simple setup for running a WordPress site using Docker containers, along with NGINX as the web server and MariaDB as the database management system. Docker allows for easy deployment and management of applications within containers, providing consistency across different environments.

## Prerequisites

Ensure you have Docker and Docker Compose installed on your system:

- [Docker Installation Guide](https://docs.docker.com/get-docker/)
- [Docker Compose Installation Guide](https://docs.docker.com/compose/install/)

## Getting Started

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/JordieYen/Inception.git
    ```

2. Navigate to the project directory:

    ```bash
    cd Inception
    ```

3. Customize the configuration (optional):
   
    - Adjust settings in the `nginx/nginx.conf` file for NGINX configurations.
    - Modify the `docker-compose.yml` file if necessary.

## Usage

### Using Makefile (for Linux/Unix)

1. To start the Docker containers, build, and run them:

    ```bash
    make all
    ```

2. To print Docker container logs:

    ```bash
    make print
    ```

3. To check running Docker containers and images:

    ```bash
    make check
    ```

4. To rebuild and recreate containers:

    ```bash
    make re
    ```

5. To stop and remove containers:

    ```bash
    make clean
    ```

6. To remove containers, images, volumes, and cleanup:

    ```bash
    make fclean
    ```

### Using Makefile (for macOS)

1. Create necessary directories for data storage:

    ```bash
    make mac
    ```

2. Follow steps 2 and 3 from the Linux/Unix usage section.

3. Cleanup for macOS:

    ```bash
    make macclean
    ```

## Customization

- **Environment Variables:** Modify environment variables in the `docker-compose.yml` file to customize settings such as database credentials, WordPress configuration, etc.
- **Volumes:** Adjust volume mappings in the `docker-compose.yml` file to specify where data should be stored on the host machine.

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request on the [GitHub repository](https://github.com/JordieYen/Inception.git).

---

**Note:** This setup is intended for development or testing purposes. Make sure to adjust configurations and security settings appropriately for production environments.
