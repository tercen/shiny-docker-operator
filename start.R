options("tercen.serviceUri"=Sys.getenv("TERCEN_SERVICE_URI"))
options("shiny.host"="0.0.0.0")
port=as.integer(Sys.getenv("TERCEN_WEB_APP_PORT", unset = "8080"))
shiny::runApp(port=port,launch.browser=FALSE)
