sp_configure 'show advanced options', 1;
GO

--Configuration option 'show advanced options' changed from 1 to 1. 
--Run the RECONFIGURE statement to install.

RECONFIGURE
GO

sp_configure 'user instance timeout', 65535;
GO

--Configuration option 'user instance timeout' changed from 5 to 5. 
--Run the RECONFIGURE statement to install.

RECONFIGURE;
GO