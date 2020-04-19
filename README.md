# under-construction

Create a simple, responsive "under construction" website easily with vue.js.

## Use cases

- You want to deploy a temporal "under construction" for you or a customer
- You (has no time / don't want) to create that site for yourself or want to use that time solving other issues.
- You need that site to be simple and responsive
- You need a Vue made website to use as template for yours


## Key features

- Vue.js made minimal frontend
- Uses Bootstrap for make the site responsive
- Configurable via env vars for customization(see `.env.dist` file)
- Deploy to Heroku or Dokku with buildpacks
- Deploy to Kubernetes cluster via Helm
- Resulting Docker image contains only `nginx` + `the built website`(as an static website) so size is arround 21 MB


## Screenshots

![](docs/images/responsive.png)


## Customization

You can customize this project by setting the corresponding env vars, just copy the `.env.dist` file to `.env.local`, change it's content and run `make npm-serve` to test the changes.

*Note:* in order to show the website images, all images must be publicly accessible
