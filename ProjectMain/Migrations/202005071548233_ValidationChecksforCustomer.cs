namespace ProjectMain.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ValidationChecksforCustomer : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Customers", "Name", c => c.String(nullable: false, maxLength: 50));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Customers", "Name", c => c.String(maxLength: 50));
        }
    }
}
