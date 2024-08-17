# Silicon Chalet Divio Demo App

A simple nginx server with an index.html saying hello and showing the number (and type) of services
currently attached.

To build and run locally:
```bash

docker build -t derlin/hello-silicon-chalet .
docker run -v 8080:80 derlin/hello-silicon-chalet
```

You can now access the app at http://localhost:8080
