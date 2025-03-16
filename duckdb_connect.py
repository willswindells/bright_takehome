
import duckdb

def db_connect():
    """
    Connects to duckdb
    """
    conn = duckdb.connect("bluesky.db")
    print("connected to duckDB")

def db_import_data():
    """
    updates via simple replace the seed table for raw bluesky data
    """
    connect()
    conn.execute("""
    CREATE OR REPLACE TABLE seed_bluesky_raw AS
    SELECT *
    FROM 'bluesky.json';
    -- FROM read_json_auto('bluesky.json');
    """)
    print("loaded_raw_file")



# conn.execute("""
# CREATE OR REPLACEfrom seed_bluesky_raw TABLE nested_record (json_record JSON);
# --INSERT INTO nested_record VALUES
# SELECT record from seed_bluesky_raw;
# """)


# conn.execute("""CALL start_ui();""")

# print("started ui")

# conn.execute("FROM seed_bluesky_raw").df()

# print("post print raw")
