namespace ProjectMain.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class passwordFieldAdded : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Customers", "Password", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Customers", "Password");
        }
    }
}
