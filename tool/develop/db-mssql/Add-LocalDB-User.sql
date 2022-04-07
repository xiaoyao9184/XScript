CREATE LOGIN $login_name WITH PASSWORD = '$login_password'
GO
CREATE USER $login_name
GO
ALTER AUTHORIZATION ON DATABASE::$db_name TO $login_name
GO