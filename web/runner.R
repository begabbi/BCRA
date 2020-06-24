library(plumber)
#http://localhost:8000/relative.risk
#https://www.rplumber.io/
#https://www.datacamp.com/community/tutorials/15-easy-solutions-data-frame-problems-r
r <- plumb("api.R")  # Where 'plumber.R' is the location of the file shown above
r$run(port=8000)

#pr$handle("POST", "/model/cancel/<id>", endpoint_model_cancel(queue),
#          serializer = serializer_json_hintr())