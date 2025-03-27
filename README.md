# flutter_itunes_search

Flutter iTunes Search

## Getting Started

This project is a starting point for a Flutter application.

Create a new Folder named ".env" on the root of the project and inside the folder create a file
named "development.env" and add the following content:

```
BASE_URL=https://itunes.apple.com/
```

In order to run the app, run the following command:

flutter run --dart-define-from-file=.env/development.env

Or

Edit the run configuration in Android Studio to point to the .env file.

- Go to Run -> Edit Configurations ->
- Add the "--dart-define-from-file=.env/development.env" in the "Additional run args" field.
