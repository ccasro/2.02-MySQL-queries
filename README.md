# 2.02-MySQL-queries

## 📄 Description

This repository contains two MySQL databases (tienda, universidad) with pre-defined schemas and sample data.
Docker Compose is used to set up and run all databases easily, ensuring anyone can start the databases
**without installing MySQL locally.**

This repository contains a total of **67 SQL queries**, with 41 corresponding to the **Store(Ex1.sql)** database and
the remaining queries to the **University (Ex2.sql)** database.
All SQL scripts are located in the /sql folder. 

## Database Diagram

### ex1 - Store Database
![Ex1 Database Diagram](docs/shop_diagram.png)
### ex2 - University Database
![ex2 Database Diagram](docs/university_diagram.png)


## 💻 Technologies used

- MySQL 8.x
- MySQL Workbench
- Docker 28.x
- Docker Compose 2.x
- IntelliJ IDEA
- Adminer (for database management in browser)
- SQL scripts for schema, data initialization and queries

## 📋 Requirements

- Docker installed and running
- Docker Compose installed (comes with Docker Desktop)
- IDE capable of handling SQL projects (e.g., IntelliJ IDEA)
- Optional: Adminer or MySQL Workbench to explore the databases

## 🛠️ Installation

1. Clone the repository:

```bash
git clone https://github.com/ccasro/2.02-MySQL-queries.git
```

2. Open the project in your IDE (e.g., IntelliJ IDEA)
3. Ensure the sql/ folder contains all SQL scripts.
4. Create a .env file in the project root (next to docker-compose.yml) with the following template:
```env
# Database settings
MYSQL_DATABASE=tienda
MYSQL_USER=miuser
MYSQL_PASSWORD=yourpassword
MYSQL_ROOT_PASSWORD=rootpassword

# Host ports
HOST_MYSQL_PORT=3306
HOST_ADMINER_PORT=8080
```
5. Make sure Docker Desktop is running and the Docker daemon is active.

## ▶️ Execution

1. Open a terminal in the project root folder
2. Run Docker Compose to start the MySQL databases:
```bash
docker compose up -d
```
3. Docker will:
    - Create containers for MySQL and Adminer
    - Initialize the databases with schemas and sample data automatically from sql/
    - Expose MySQL ports (default 3306) and Adminer (default 8080)

4. Access the databases:
    - Adminer: http://localhost:8080
        - Server: db
        - User: miuser
        - Password: as defined in your .env file
        - Databases: tienda, universidad
5. To stop the containers:
```bash
docker compose down
```
## 🌐 Deployment

No production deployment is required. The setup is intended for local development and testing purposes using Docker

## 🤝 Contributions

- Use the main branch for development.
- Make small, frequent commits following Conventional Commits.
- Do not commit sensitive credentials or compiled files
- To propose improvements, create a branch and open a pull request.