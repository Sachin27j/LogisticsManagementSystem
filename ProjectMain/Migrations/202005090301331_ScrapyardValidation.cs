namespace ProjectMain.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ScrapyardValidation : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Scrapyards", "Owner", c => c.String(nullable: false, maxLength: 50));
            AlterColumn("dbo.Scrapyards", "Location", c => c.String(nullable: false, maxLength: 50));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Scrapyards", "Location", c => c.String());
            AlterColumn("dbo.Scrapyards", "Owner", c => c.String());
        }
    }
}
