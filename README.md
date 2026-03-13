# Instagram Home Feed Flutter Clone

Production-quality Flutter project that replicates Instagram Home Feed UI with clean architecture, smooth interactions, shimmer loading states, and pagination.

## Project Overview

This app is designed for technical interview evaluation and demonstrates:

- Pixel-focused Instagram-like feed UI
- Clean architecture with clear separation of concerns
- Provider-based state management
- Smooth carousel and pinch-to-zoom media interactions
- Infinite feed pagination with delayed mock API
- Shimmer loading placeholders for a polished loading experience

## Features Implemented

- Instagram-style top bar:
	- Instagram wordmark style title
	- Notifications icon
	- Messages icon
- Stories tray:
	- Horizontal scroll
	- Circular avatars
	- Gradient story borders
- Post feed:
	- User header with avatar, username, and more options icon
	- Single image and carousel media posts
	- Dot indicator synchronized with carousel index
	- Like, comment, share, save action row
	- Caption and likes count area
- Interaction behavior:
	- Like and save toggle locally
	- Comment/share show Snackbar with message: Feature coming soon
	- Pinch-to-zoom media with smooth animated reset
- Data and loading:
	- Repository-driven post loading (no UI hardcoded data)
	- Simulated network delay: 1500ms per page
	- Shimmer loading skeletons for stories and post cards
- Infinite scroll:
	- Loads next page near feed bottom
	- 10 posts per page
	- Appends smoothly without list jumps
- Robust media handling:
	- Cached network images
	- Placeholder while loading
	- Fallback UI on image load failure

## State Management (Provider)

`PostProvider` is responsible for:

- Initial feed bootstrap
- Pagination state (`isLoadingMore`, `hasMore`, page index)
- Local interaction state (`isLiked`, `isSaved`, `currentMediaIndex`)
- Refresh flow

UI widgets are kept presentation-focused and delegate mutation logic to provider methods.

## Folder Architecture

lib/
├── models/
│   ├── post_model.dart
│   └── user_model.dart
├── providers/
│   └── post_provider.dart
├── repositories/
│   └── post_repository.dart
├── screens/
│   └── home_screen.dart
├── services/
│   └── api_service.dart
├── utils/
│   └── constants.dart
├── widgets/
│   ├── post_actions.dart
│   ├── post_card.dart
│   ├── shimmer_loader.dart
│   ├── story_item.dart
│   └── story_list.dart
└── main.dart

## Dependencies

- provider
- shimmer
- cached_network_image

## How To Run

1. Ensure Flutter stable SDK is installed.
2. Install dependencies:

	 flutter pub get

3. Run the app:

	 flutter run

## Demo Instructions

1. Launch app and wait for shimmer placeholders.
2. Verify story tray horizontal scrolling.
3. Scroll feed and observe post cards.
4. Swipe carousel posts and verify indicator changes.
5. Pinch an image to zoom and release to see smooth reset animation.
6. Tap like/save icons to validate local toggle states.
7. Tap comment/share to view Feature coming soon Snackbar.
8. Scroll near feed end to trigger automatic next-page load.
