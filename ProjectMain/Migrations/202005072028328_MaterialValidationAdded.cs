namespace ProjectMain.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class MaterialValidationAdded : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Materials", "Name", c => c.String(nullable: false, maxLength: 50));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Materials", "Name", c => c.String());
        }
    }
}
