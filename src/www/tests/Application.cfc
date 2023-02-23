/**
* Copyright Since 2005 Ortus Solutions, Corp
* www.ortussolutions.com
**************************************************************************************
*/
component{
	this.name = "A TestBox Runner Suite " & hash( getCurrentTemplatePath() );
	// any other application.cfc stuff goes below:
	this.sessionManagement = true;

	// any mappings go here, we create one that points to the root called test.
	this.mappings[ "/tests" ] = getDirectoryFromPath( getCurrentTemplatePath() );
	// Map back to its root
	rootPath = REReplaceNoCase( this.mappings[ "/tests" ], "tests(\\|/)$", "" );
	this.mappings[ "/testbox" ] = rootPath;
	// Map resources
	this.mappings[ "/coldbox" ] = this.mappings[ "/tests" ] & "resources/coldbox";

	// any orm definitions go here.
	this.ormenabled							= true;
	this.ormsettings.dbcreate				= 'none';					// valid settings: none | update | dropcreate
	// this.ormsettings.flushatrequestend		= false;					// we are going to manually commit all transactions
	// this.ormsettings.automanagesession		= false;					// we are going to manually commit all transactions

	// this.ormsettings.secondarycacheenabled	= false;

	//this.ormsettings.cacheprovider			= 'EHCache';
	//this.ormsettings.cacheconfig			= expandPath('/ta/config/EHCache.xml.cfm');

	//this.ormsettings.cacheprovider			= 'HashTable';
	//this.ormsettings.cacheconfig			= expandPath('/ta/config/EHCache.xml.cfm');

	this.ormsettings.cfclocation			= ['/domain/persistent'];		// CFC location (s)
	// this.ormsettings.logSQL 				= request.app.ormLogSQL;	// log generated sql to terminal or file for review
	this.ormsettings.datasource				= 'test_dsn';	// default DB for ORM
	// this.ormsettings.dialect				= request.app.ormDialect;	// set in environments to support alternate databases
	// this.ormsettings.useDBForMapping		= false;					// false = do not walk the db on startup trying to create ORM definitions (false=faster startup)



	// request start
	public boolean function onRequestStart( String targetPage ){
		return true;
	}
}