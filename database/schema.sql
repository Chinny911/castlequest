--Creating user table

CREATE TABLE users
(
    "emailaddress" text NOT NULL,
    "firstname" text NOT NULL,
    "lastname" text NOT NULL,
    "password" text NOT NULL,
    "DOB" date,
    PRIMARY KEY ("emailaddress")
);

--creating Guilds:

CREATE TABLE guilds
(
    "guildid" integer NOT NULL,
    "guildname" text NOT NULL,
    PRIMARY KEY ("guildid")
);

--Creating player table:

CREATE TABLE players
(   
    "playerid" integer NOT NULL,
    "playername" text NOT NULL UNIQUE,
    "emailaddress" text NOT NULL,
    "xplevel" integer,
    "hp" integer,
    "gold" integer,
    "guildid" integer,
    PRIMARY KEY ("playerid"),
    CONSTRAINT "emailaddress" FOREIGN KEY ("emailaddress")
        REFERENCES users ("emailaddress") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "guildid" FOREIGN KEY ("guildid")
        REFERENCES guilds ("guildid") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

--creating items table:
CREATE TABLE items
(
    "itemid" integer NOT NULL,
    "itemname" text NOT NULL,
    PRIMARY KEY ("itemid")
);

--creating playerItems table

CREATE TABLE playeritems
(
    "itemid" integer NOT NULL,
    "numberofitems" integer,
    "playerid" integer,
    --PRIMARY KEY ("itemID"),
    CONSTRAINT "playerid" FOREIGN KEY ("playerid")
        REFERENCES players ("playerid") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "itemid" FOREIGN KEY ("itemid")
        REFERENCES items ("itemid") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

--creating itemPrices:
CREATE TABLE itemprices
(
    "itemid" integer NOT NULL,
    "gold" integer NOT NULL,
    CONSTRAINT "itemid" FOREIGN KEY ("itemid")
        REFERENCES items ("itemid") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE MATERIALIZED VIEW player_leaderboard AS 
SELECT 
    playername, xplevel
FROM players
ORDER BY xplevel DESC
LIMIT 10;

CREATE MATERIALIZED VIEW guild_leaderboard AS
SELECT guilds.guildname, players.playername, players.xplevel
FROM players 
LEFT JOIN guilds ON guilds.guildid = players.guildid
WHERE players.xplevel IN (
    SELECT MAX(xplevel)
    FROM players
    WHERE guildid IS NULL OR (guildid = guilds.guildid AND guildid IS NOT NULL)
    GROUP BY guildid
    UNION
    SELECT MAX(xplevel)
    FROM players
    WHERE guildid IS NULL
);

/*
DROP ROLE IF EXISTS castlequest_admin;
CREATE ROLE castlequest_admin WITH
        LOGIN
        NOSUPERUSER
        INHERIT
        NOCREATEDB
        CREATEROLE
        NOREPLICATION
        PASSWORD 'Woodruff1787';
GRANT CONNECT ON DATABASE castlequest TO castlequest_admin;
GRANT SELECT ON ALL TABLES IN SCHEMA publiuc TO castlequest_admin;
GRANT SELECT ON users TO castlequest_admin;
GRANT SELECT ON player_leaderboard TO castlequest_admin;
GRANT SELECT ON guild_leaderboard TO castlequest_admin;
*/

DROP ROLE IF EXISTS castlequest_game;
CREATE ROLE castlequest_game WITH
        LOGIN
        NOSUPERUSER
        NOINHERIT
        NOCREATEDB
        NOCREATEROLE
        NOREPLICATION
        PASSWORD 'bus-3340';
GRANT CONNECT ON DATABASE castlequest TO castlequest_game;
GRANT USAGE ON SCHEMA public TO castlequest_admin;
GRANT SELECT ON player_leaderboard TO castlequest_game;
GRANT SELECT ON guild_leaderboard TO castlequest_game;
--GRANT EXECUTE generateLeaderboards.py, tradingPost.py TO [castlequest_game];
--GRANT USAGE ON tradingPost.py TO castlequest_game;

DROP ROLE IF EXISTS castlequest_login;
CREATE ROLE castlequest_login WITH
        LOGIN
        NOSUPERUSER
        NOINHERIT
        NOCREATEDB
        NOCREATEROLE
        NOREPLICATION
        PASSWORD 'bus-3320';
GRANT CONNECT ON DATABASE castlequest TO castlequest_login;
GRANT USAGE ON SCHEMA public TO castlequest_login;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO castlequest_login;
GRANT SELECT ON users TO castlequest_login;
GRANT SELECT ON player_leaderboard TO castlequest_login;
GRANT SELECT ON guild_leaderboard TO castlequest_login;







