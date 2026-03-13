# Instagram Clone

A Flutter Instagram Home Feed clone with clean architecture, smooth interactions, and interview-ready code quality.

## Overview

This project focuses on a polished Instagram-like feed experience:

- Dark-mode Instagram-style UI
- Stories tray with gradient rings
- Feed posts with actions, caption, and likes
- Local like/save toggles
- Shimmer loading state
- Infinite scroll pagination
- Cached network images with fallbacks

## Tech Stack

- Flutter (stable)
- Provider (state management)
- cached_network_image
- shimmer
- flutter_svg

## Project Structure

```text
lib/
├── models/
│   ├── app_constants.dart
│   ├── post_model.dart
│   └── user_model.dart
├── providers/
│   └── post_provider.dart
├── repositories/
│   ├── api_service.dart
│   └── post_repository.dart
├── screens/
│   └── home_screen.dart
├── widgets/
│   ├── instagram_bottom_navigation.dart
│   ├── instagram_svg_icon.dart
│   ├── post_actions.dart
│   ├── post_card.dart
│   ├── shimmer_loader.dart
│   ├── story_item.dart
│   └── story_list.dart
└── main.dart
```

## Architecture Notes

- `repositories/` handles data and mocked API behavior.
- `providers/` manages UI state and business events.
- `widgets/` contains reusable presentation components.
- `screens/` composes page-level UI.
- `models/` contains entities and shared constants.

## Key Features

1. Top bar with Instagram-style layout and icon set
2. Stories list with circular avatars and gradient borders
3. Post cards with:
   - Header (profile, username, audio row)
   - Single image or carousel media
   - Action row (like/comment/repost/send/save)
   - Caption and likes section
4. Pinch-to-zoom for media with smooth reset animation
5. Pagination (10 posts per page) with delayed mock API (`1500ms`)
6. Shimmer skeletons while loading

## Run Locally

1. Install Flutter stable SDK
2. Get packages:

```bash
flutter pub get
```

3. Run app:

```bash
flutter run
```

## Demo Checklist

1. Open app and verify shimmer placeholders
2. Scroll stories horizontally
3. Scroll feed and observe pagination
4. Swipe carousel posts and check dot indicator
5. Test like/save toggles
6. Tap comment/share/repost icons and check Snackbar behavior

## App Name

The app display name is set to **Instagram Clone** on Android, iOS, and Web.
