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
       "type": "string"
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

curl -XPOST 'http://search-mobi-an4nkg7vv2dd7f56ttw6dyugfe.us-east-1.es.amazonaws.com/taxi-pos/taxi-record/' -d '
{
 "id": "328974kl2j4lk2j4lj2l",
 "type": "premium",
 "timestamp": "2015-10-20T11:01:11.191991",
 "location": {
	"lat": 0.0980909,
	"lon": 0.0808872
	}
}
'

{"query" : {"term" : { "id" : "Wc5a5Wsczm" } } }

curl -XGET 'https://search-mobi-an4nkg7vv2dd7f56ttw6dyugfe.us-east-1.es.amazonaws.com/taxi-pos/taxi-record/_search' -d '
{"query": {"filtered": {"filter": [ {"geo_distance": {"distance": "100m","location": {"lat": 0.098,"lon": 0.081 }}}, { "range": { "timestamp": { "gte": "now-1m" }}} ] }}}
'

curl -XGET 'https://search-mobi-an4nkg7vv2dd7f56ttw6dyugfe.us-east-1.es.amazonaws.com/taxi-pos/taxi-record/_search' -d '
{"query": {"filtered": {"filter": {"geo_distance": {"distance": "1km","location": {"lat": -23.594,"lon": -46.620 }}}}}}
'
{"query": {"filtered": {"filter": {"geo_distance": {"distance": "100m","location": {"lat": 0.098,"lon": 0.081 }}}}}}


{
 "id": "328974kl2j4lk2j4lj2l",
 "type": "premium",
 "timestamp": "2015-10-20T11:01:11.191991",
 "position": {
	"lat": 0.0980909,
	"lon": 0.0808872
	}
}


{"id": "328974kl2j4lk2j4lj2l","type": "premium","timestamp": "2015-10-20T11:01:11.191991","position": {"lat": 0.0980909,"lon": 0.0808872}}
