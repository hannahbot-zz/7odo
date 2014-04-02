# 7odo - API todo app

This is a basic api only to-do app. This uses basic authentication.

##Create Lists
curl --user "user:password" curl -X POST -H "Content-Type: application/json" -d '{"title":"hidden list", "viewable":"false", "open":"false"}' http://localhost:3000/api/v1/lists

##Create Items
curl --user "user:password" curl -X POST -H "Content-Type: application/json" -d '{"param1":"value1", "list_id":"insert_integer"}' http://localhost:3000/api/v1/items

##Delete List
curl --user "user:password"  curl -X DELETE http://localhost:3000/api/v1/lists/id

##Delete Item
curl --user "user:password"  curl -X DELETE http://localhost:3000/api/v1/items/id

##Mark Item as Complete
curl --user "user:password" -X PUT -H "Content-Type: application/json" -d '{"completed":"true"}' http://localhost:3000/api/v1/items/id

##Modify viewable and open on a List
curl --user "user:password" -X POST -H "Content-Type: application/json" -d '{"viewable":"false", "open":"false"}' http://localhost:3000/api/v1/lists/id
