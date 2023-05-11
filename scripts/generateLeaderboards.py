import psycopg2

con = psycopg2.connect(
    host='localhost',
    database='castlequest',
    user='postgres',
    password='Gozie19%_')

with con.cursor() as c:
    c.execute('''REFRESH MATERIALIZED VIEW player_leaderboard''')
    c.execute('''REFRESH MATERIALIZED VIEW guild_leaderboard''')

con.commit()




#Hey I have no idea how you made your leaderboards!
#But update them using SQL!