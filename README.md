# test_project

Priority Soft assessment project.

## About

- Cubit and Hooks as state management.
- Freezed for model entity.
- Loosely follow clean architecture.
- HydratedBloc to persist cart items.
- Supabase to implement edge functions as firebase required payment for it's function integration.
- Firestore for database with three collections 'products', 'reviews' and 'orders'.
- Supabase and firebase creds attached to project for reference
- Use of enums rather than models for representing various business entities.

## Getting Started
- Run ```dart run build_runner build -d``` to build freezed objects.
- No flavor implementation so flutter run is enough

## Challenges
- Exposure to typescript for handling edge functions in supabase
- Minimizing API calls to stay under firebase quota
- Desiging of a few UI elements and trying to adhere to the given design.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

