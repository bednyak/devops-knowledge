# COMMAND FOR EXECUTE DATABASE MIGRATION ON POSTGRESQL

## Commands
- Create DB dump of database with name 'dev' from docker container 'backend-db-dev'
```
docker exec backend-db-dev pg_dump -U postgres -w dev > /root/my_backup_db_$(date +"\%Y-\%m-\%d_\%H-\%M-\%S").sql
```
- Copy DB dump *.sql file inside of docker container
```
docker cp /root/my_backup_db_2023-07-11_11-27-01.sql backend-db-preprod:/my_backup_db_2023-07-11_11-27-01.sql
```
- Import DB dump *.sql into database
```
docker exec backend-db-preprod pg_restore -U postgres -d testdb /root/my_backup_db_2023-07-11_11-27-01.sql
```
- For creating extensions as a root user, before importing DB dump (postgresql_user is root)
```
psql -U postgresql_user test
CREATE EXTENSION "uuid-ossp";
```