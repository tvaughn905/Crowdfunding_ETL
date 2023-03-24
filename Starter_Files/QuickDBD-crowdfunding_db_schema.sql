-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/zPbWQo
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Campaign] (
    [cf_id] int  NOT NULL ,
    [contact_id] int  NOT NULL ,
    [company_name] varchar(50)  NOT NULL ,
    [description] varchar(50)  NOT NULL ,
    [goal] float(50)  NOT NULL ,
    [pledged] float(50)  NOT NULL ,
    [outcome] varchar(50)  NOT NULL ,
    [backers_count] int  NOT NULL ,
    [country] varchar(50)  NOT NULL ,
    [currency] varchar(50)  NOT NULL ,
    [launch_date] int  NOT NULL ,
    [end_date] int  NOT NULL ,
    [category_id] varchar(50)  NOT NULL ,
    [subcategory_id] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED (
        [cf_id] ASC
    )
)

CREATE TABLE [category] (
    [category_id] varchar(50)  NOT NULL ,
    [category] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED (
        [category_id] ASC
    )
)

CREATE TABLE [contacts] (
    [contact_id] varchar(50)  NOT NULL ,
    [first_name] varchar(50)  NOT NULL ,
    [last_name] varchar(50)  NOT NULL ,
    [email] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_contacts] PRIMARY KEY CLUSTERED (
        [contact_id] ASC
    )
)

CREATE TABLE [subcategory] (
    [subcategory_id] varchar(50)  NOT NULL ,
    [subcategory] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_subcategory] PRIMARY KEY CLUSTERED (
        [subcategory_id] ASC
    )
)

ALTER TABLE [Campaign] WITH CHECK ADD CONSTRAINT [FK_Campaign_contact_id] FOREIGN KEY([contact_id])
REFERENCES [contacts] ([contact_id])

ALTER TABLE [Campaign] CHECK CONSTRAINT [FK_Campaign_contact_id]

ALTER TABLE [Campaign] WITH CHECK ADD CONSTRAINT [FK_Campaign_category_id] FOREIGN KEY([category_id])
REFERENCES [category] ([category_id])

ALTER TABLE [Campaign] CHECK CONSTRAINT [FK_Campaign_category_id]

ALTER TABLE [Campaign] WITH CHECK ADD CONSTRAINT [FK_Campaign_subcategory_id] FOREIGN KEY([subcategory_id])
REFERENCES [subcategory] ([subcategory_id])

ALTER TABLE [Campaign] CHECK CONSTRAINT [FK_Campaign_subcategory_id]

COMMIT TRANSACTION QUICKDBD