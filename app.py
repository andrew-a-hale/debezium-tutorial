import sqlalchemy
import sqlalchemy.dialects.mysql

def main():
    uri = "mysql+mysqldb://mysqluser:mysqlpw@localhost:33060/inventory"
    engine = sqlalchemy.create_engine(uri)
    with engine.connect() as conn:
        df = conn.execute(sqlalchemy.text("SELECT * FROM customers"))
        conn.execute(sqlalchemy.text("INSERT INTO customers (first_name, last_name, email) VALUES ('Andrew', 'Hale', 'me@here.com')"))
        conn.commit()
        print(df.all())
        
    
    
if __name__ == "__main__":
    main()