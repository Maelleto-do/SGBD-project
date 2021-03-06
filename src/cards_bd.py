#!/usr/bin/env python3

import yaml
import os
import logging
import pymysql

logging.basicConfig(level=logging.DEBUG)

script_dir = os.path.dirname(__file__)
yaml_file = script_dir + "/sql_src.yaml"

global sql_src


def db_execute(conn, sql, args=None):
    """Wrapper to execute a command to the database."""
    affected_rows = 0
    try:
        with conn.cursor() as cur:
            affected_rows = cur.execute(sql, args)
        conn.commit()
    except pymysql.err.InternalError as e:
        logging.error("Error executing sql command : " + str(e))
    return cur


def load_commands(commands_file):
    global sql_src
    with open(commands_file, "r") as stream:
        try:
            sql_src = yaml.safe_load(stream)
        except yaml.YAMLError as exc:
            print(exc)


def init():
    load_commands(yaml_file)


def close():
    pass


# Consultation


def cards_by_type(conn, card_type="NORMAL"):
    """List cards of a certain type."""
    sql_req = sql_src["consultation"]["cards_by_type"]
    logging.debug("Consulted cards of type '%s'", card_type)
    return db_execute(conn, sql_req, card_type)


def cards_in_possession(conn):
    """List cards that are or have been owned by a player."""
    sql_req = sql_src["consultation"]["cards_in_possession"]
    logging.debug("Consulted cards owned by players")
    return db_execute(conn, sql_req)


def cards_not_in_deck(conn):
    """List cards that are not in any deck"""
    sql_req = sql_src["consultation"]["cards_not_in_deck"]
    logging.debug("Consulted cards that are not in any deck")
    return db_execute(conn, sql_req)


def players_collectors(conn):
    """List players that didn't participated in a game."""
    sql_req = sql_src["consultation"]["players_collector"]
    logging.debug("Consulted players that have not played (collectors)")
    return db_execute(conn, sql_req)


# Statistic


def player_nb_cards(conn):
    """List players and the number of cards they own."""
    sql_req = sql_src["stats"]["player_nb_cards"]
    logging.debug("Consulted stats for the number of cards per player")
    return db_execute(conn, sql_req)


def players_by_value(conn):
    """List player in descending order by the value of their collection."""
    sql_req = sql_src["stats"]["players_by_value"]
    logging.debug(
        "Consulted stats for listing players in descending order by the value of their collection"
    )
    return db_execute(conn, sql_req)


def cards_in_decks(conn):
    """List cards and the number of players that use them in their decks."""
    sql_req = sql_src["stats"]["cards_in_decks"]
    logging.debug(
        "Consulted stats for cards and the number of players that use them in their decks"
    )
    return db_execute(conn, sql_req)


def player_rare_collectors(conn):
    """List players who own the maximum of rare card."""
    sql_req = sql_src["stats"]["cards_in_decks"]
    logging.debug("Consulted stats for players who own the maximum of rare card")
    return db_execute(conn, sql_req)


def cards_familly(conn):
    """List card family and the caracteristic in which this family has the best level."""
    sql_req = sql_src["stats"]["cards_family"]
    logging.debug(
        "Consulted stats for family and the caracteristic in which this family has the best level"
    )
    return db_execute(conn, sql_req)
