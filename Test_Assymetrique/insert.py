#!/usr/bin/python
# -*- coding: utf-8 -*-
# Script permettant l'ajout des données dans la base

__author__ = 'mLab'

import sys
import pymongo
import json

### Lien uri de la base

uri = 'mongodb://ibis:aqw@ds013004.mlab.com:13004/tartiflette'

###############################################################################
# main
###############################################################################

def main(args):

    client = pymongo.MongoClient(uri)

    db = client.get_default_database()

		# Nom de la collection
    traceroute = db['traceroute_2017_06_28']
    i = 1
    # Note that the insert method can take either an array or a single dict.
    while i <= 2000 :
        json_data = open("json/new_mongo"+str(i)+".json")
        new_widget = json.load(json_data)
        traceroute.insert(new_widget)
        print i
        i+=1

    client.close()


if __name__ == '__main__':
    main(sys.argv[1:])
