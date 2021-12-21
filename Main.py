import flask
import psycopg2
from flask import request, jsonify
from datetime import datetime

app = flask.Flask(__name__)
app.config["DEBUG"] = True

@app.route('/v1/menu/all', methods=['GET'])
def get_menu():
    con = psycopg2.connect(database="Gestione_pizzeria", user="postgres", password="7991", host="127.0.0.1", port="5432")
    print(con)
    cur = con.cursor()
    cur.execute('''SELECT * FROM public."Menù" ORDER BY "idM" ASC''')
    rows = cur.fetchall()
    con.close()
    return jsonify(rows)


@app.route('/v1/tavolo/all', methods=['GET'])
def get_tavolo():
    con = psycopg2.connect(database="Gestione_pizzeria", user="postgres", password="7991", host="127.0.0.1", port="5432")
    print(con)
    cur = con.cursor()
    cur.execute('''SELECT * FROM public."Tavolo" ORDER BY "idT" ASC''')
    rows = cur.fetchall()
    con.close()
    return jsonify(rows)


@app.route('/v1/ordini/all', methods=['GET'])
def get_ordini():
    con = psycopg2.connect(database="Gestione_pizzeria", user="postgres", password="7991", host="127.0.0.1", port="5432")
    print(con)
    cur = con.cursor()
    cur.execute('''SELECT * FROM public."Ordini" ORDER BY "idO" ASC''')
    rows = cur.fetchall()
    con.close()
    return jsonify(rows)

app.run()



