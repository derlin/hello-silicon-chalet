# Silicon Chalet Divio Demo App

This is a simple nginx server with an `index.html` saying hello and showing the number (and type) of
services currently attached.

It was used for a demo during my presentation at
[Silicon Chalet](https://www.meetup.com/silicon-chalet/) on the 19th of
September:

> **I migrated 7,000 applications from PostgreSQL 13 to 15**
> by Lucy Linder (Divio Technologies AB)
> 
> Ever wondered how a small team can migrate 7,000 PostgreSQL databases in just two months without
> disrupting service? Join me as I share how Divio pulled this off! I'll brush on strategies that
> made it possible, the challenges we faced, and the extra lengths we went to keep our users' peace
> of mind unscathed.

You will find the slides of the presentation and a recording of this demo on this
repository, in the [other](#other) folder:

* [slides](other/2024-09-17_how-we-migrated-7k-postgres-databases_slides.pdf)
* [demo](other/2024-09-17_deploy-to-divio_demo.mov)

## Run locally

To build and run locally:
```bash

docker build -t derlin/hello-silicon-chalet .
docker run -v 8080:80 derlin/hello-silicon-chalet
```

You can now access the app at http://localhost:8080

## Deploy on Divio

The full demo is available in this repo:
[other/2024-09-17_deploy-to-divio_demo.mov](other/2024-09-17_deploy-to-divio_demo.mov).

Deploy it on [divio](https://divio.com) easily:

0. Fork this repository
1. Create an account on [divio](https://control.divio.com)
2. Click "add application"
3. Select "I already have a repository"
4. Connect to Github and select your forked repository
5. Choose a plan and "Create application"

Now, you can just hit "Deploy" on the live environment. If you want to add a service, go to the
services tab.
