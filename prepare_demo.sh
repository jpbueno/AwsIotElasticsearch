#!/bin/bash

curl -XDELETE 'http://search-truck-d3s5kal5qvku5mh4ng4qrl6v5u.us-east-1.es.amazonaws.com/trucks'

curl -XPUT 'http://search-truck-d3s5kal5qvku5mh4ng4qrl6v5u.us-east-1.es.amazonaws.com/trucks' -d '
{
  "settings": {
    "number_of_shards":   10,
    "number_of_replicas": 0
  }
}
'

curl -XPUT 'http://search-truck-d3s5kal5qvku5mh4ng4qrl6v5u.us-east-1.es.amazonaws.com/trucks/_mapping/truck' -d '
{
  "properties": {
    "nms" : {
       "type": "string"
    },
    "engine_temperature" : {
       "type": "integer"
    },
    "engine_temperature_celsius" : {
	"type" : "double"
    },
    "cargo_temperature_celsius" : {
        "type" : "double"
    },
    "timestamp": {
         "type": "date"
     },
    "location" : {
        "type": "geo_point"
    },
    "cargo_temperature": {
         "type": "string"
     }
   }
}
'
