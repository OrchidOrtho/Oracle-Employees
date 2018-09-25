EXECUTE sp_addrolemember @rolename = N'db_owner', @membername = N'ORCHID\SQLAdmin';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'SQLOracleHRISUser';


GO
EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'ORCHID\PhillipsJ';

