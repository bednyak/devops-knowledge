# COMMAND FOR EXECUTE DATABASE MIGRATION ON MYSQL

## Commands
- Create DB dump of database with name 'dev'. Execute only from MySQL root user
```
sudo mysqldump -h localhost -u root --password="PMFHWLjWTCHszBdaeRb9F9Gt" dev > /var/db/backup_database.sql 
```