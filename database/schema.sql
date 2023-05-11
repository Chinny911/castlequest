CREATE TABLE "user"
(
    "emailAddress" text NOT NULL,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    password text NOT NULL,
    "DOB" date,
    PRIMARY KEY ("emailAddress")
);

--Creating player table:

CREATE TABLE player
(
    "playerName" text NOT NULL,
    "xpLevel" integer,
    "HP" integer,
    "Gold" integer,
    PRIMARY KEY ("playerName")
);

--creating playerItems table

CREATE TABLE playerItems
(
    "itemID" integer NOT NULL,
    "numberOfItems" integer,
    "playerName" text,
    PRIMARY KEY ("itemID"),
    CONSTRAINT "playerName" FOREIGN KEY ("playerName")
        REFERENCES player ("playerName") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

--creating playerGuild:

CREATE TABLE playerGuild
(
    "guildID" integer NOT NULL,
    "guildName" text NOT NULL,
    "playerName" text,
    PRIMARY KEY ("guildID"),
    CONSTRAINT "playerName" FOREIGN KEY ("playerName")
        REFERENCES player ("playerName") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

--creating items table:

CREATE TABLE items
(
    "itemID" integer NOT NULL,
    "itemName" text NOT NULL,
    PRIMARY KEY ("itemID", "itemName")
);

--creating tradingPost table:

CREATE TABLE tradingPost
(
    "itemID" integer NOT NULL,
    "itemPrice" integer NOT NULL,
    "playerName" text NOT NULL
);

--creating leaderboard table:

CREATE TABLE leaderboard
(
    "playerName" text,
    "guildID" integer,
    "xpLevel" integer,
    CONSTRAINT "playerName" FOREIGN KEY ("playerName")
        REFERENCES player ("playerName") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "guildID" FOREIGN KEY ("guildID")
        REFERENCES playerGuild ("guildID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);