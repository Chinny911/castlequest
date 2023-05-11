import psycopg2

con = psycopg2.connect(
    host='localhost',
    database='castlequest',
    user='postgres',
    password='Gozie19%_')

print("=== Welcome to the Trading Post ===")
#Does the player even exist?
cur = con.cursor()
found = False
while found == False:
    playername = input("What is your playername?")
    with con.cursor() as curs:
        curs.execute(f"SELECT playername FROM players WHERE LOWER(playername) = %s", (playername.lower(),))
        for record in curs:
            found = True
            if found:
                print(f"Welcome {playername}")
            else:
                print("Playername does not exist!")
                break
       
      
#It would be nice to show them their inventory.
#Maybe include the price for each item

itemToSell = input("What would you like to sell? ")

#Do they have one to sell?

#What is the price?

#Give them the gold

#Take it out of their inventory