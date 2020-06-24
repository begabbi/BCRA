# Absolute Risk Plumber Runner

This example runs the [plumber.io](https://www.rplumber.io/) package and loads an api for `absolute.risk`, `relative.risk`, `check.summary`, `risk.summary`.

## Steps

1. open `R` and run `install.packages("plumber")`
2. wait... the install took about 10 minutes
3. exit `R`
4. `cd web`
5. run `Rscript runner.R`
6. Open `http://localhost:8000/absolute.risk`
7. It still has a GET so you can see it in the browser  
Example query
`?age=70biopsies=0&hyperplasia=1&menstruation=10&first_birth=20&relatives=1&race=1&Raw_Ind=1&Avg_White=0`
8. Download [postman](https://www.postman.com/)
9. Add `http://localhost:8000/absolute.risk` to url
10. Set verb to POST 
11. Set body to JSON
example body `{
              	"age": 75,
              	"biopsies":1,
              	"hyperplasia": 1,
              	"menstruation": 19,
              	"first_birth": 40,
              	"relatives": 5,
              	"race": 1,
              	"Raw_Ind": 1,
              	"Avg_White": 0
              }`
## Issues

1. update R to 4 
2. get `devtools::install_github("trestletech/plumber")` to loose error on POST request
(needs devtools installed)

## To Do

1. replace BCRA files with package/library
2. Add CORS and test over web
3. Deploy - will Heroku handle an R server?