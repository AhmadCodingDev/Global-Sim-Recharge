# Global-Sim-Recharge
Global SIM Recharge is a Flutter application that helps travelers discover, purchase, and manage international eSIM plans from a single experience. The project provides end-to-end flows for onboarding, plan selection, secure checkout, and post-purchase management while embracing responsive design, localization, and reusable UI components.

## Table of Contents
- [Features](#features)
- [Architecture Highlights](#architecture-highlights)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Running the App](#running-the-app)
- [Testing](#testing)
- [Assets & Fonts](#assets--fonts)
- [Contributing](#contributing)
- [License](#license)

## Features
- **Onboarding & Authentication** – Includes sign-in, sign-up, password reset, and OTP verification screens built on declarative routing to cover the complete account lifecycle.【F:lib/router/app_router_config.dart†L33-L60】
- **Plan Discovery & Details** – Browse regional and global eSIM packages, view detailed plan information, and review current or archived eSIMs through dedicated screens such as home, package, and details pages.【F:lib/router/app_router_config.dart†L60-L72】【F:lib/l10n/app_localizations.dart†L55-L144】
- **Secure Transactions** – Guide users through wallet funding, saved cards, and a secure checkout experience for global top-ups.【F:lib/router/app_router_config.dart†L72-L88】【F:lib/l10n/app_localizations.dart†L102-L143】
- **Post-Purchase Support** – Provide activation guides, QR code installation, order summaries, and multilingual resources to help travelers get connected quickly.【F:lib/router/app_router_config.dart†L60-L75】【F:lib/l10n/app_localizations.dart†L145-L219】
- **Referral & Engagement Tools** – Encourage growth with refer-and-earn flows, membership tracking, and promotional messaging surfaced directly in the UI copy.【F:lib/router/app_router_config.dart†L60-L77】【F:lib/l10n/app_localizations.dart†L156-L190】

## Architecture Highlights
- **MaterialApp with GoRouter** – The app bootstraps a `MaterialApp.router` configured with `go_router` for declarative navigation and fade transitions between screens, keeping routing logic centralized and testable.【F:lib/main.dart†L25-L48】【F:lib/router/app_router_config.dart†L31-L104】
- **Responsive Layouts** – `ScreenUtilInit` establishes breakpoints and scaling so typography and sizing adapt cleanly across devices, including split-screen modes.【F:lib/main.dart†L26-L34】
- **Error Visibility** – Global Flutter error hooks capture both framework and platform errors to improve diagnostics in production builds.【F:lib/main.dart†L8-L19】
- **Design System** – Reusable color constants and theme definitions drive a consistent look-and-feel across light and dark modes.【F:lib/constants/app_colors.dart†L4-L66】【F:lib/app/themes.dart†L1-L79】
- **Localization Ready** – `AppLocalizations` centralizes translatable strings for the entire user journey, paving the way for multi-language support.【F:lib/l10n/app_localizations.dart†L1-L220】

## Project Structure
```
lib/
├─ app/                # Theme, sizing, and route helpers
├─ app_transitions/    # Shared transition widgets and animations
├─ constants/          # Colors, spacing, and reusable constants
├─ l10n/               # Localization delegates and copy
├─ models/             # Data models for plans, orders, etc.
├─ router/             # go_router configuration and helpers
├─ utils/              # Common utilities
├─ views/              # Screen widgets organized by feature
└─ main.dart           # App entry point
```
【adb007†L1-L1】

## Getting Started
1. **Install Flutter** – Ensure Flutter SDK 3.8 or newer is installed and added to your path.
2. **Fetch dependencies** – Run `flutter pub get` to download required packages such as `go_router`, `flutter_screenutil`, and `flutter_svg` used across the UI.【F:pubspec.yaml†L1-L39】
3. **Prepare assets** – All images, SVGs, and fonts are declared in `pubspec.yaml`, so Flutter automatically bundles them during builds.【F:pubspec.yaml†L39-L112】

## Running the App
```bash
flutter run
```
By default the project launches the sign-in flow (`AppRouter.signIn`) and applies safe-area handling for modern device cutouts.【F:lib/router/app_router_config.dart†L33-L53】【F:lib/main.dart†L33-L45】

## Testing
The project includes the default Flutter testing setup. Run the full test suite with:
```bash
flutter test
```
## Assets & Fonts
- Images and SVG icons covering providers, countries, and onboarding illustrations live under `assets/images/` and are registered for use in widgets.【F:pubspec.yaml†L39-L105】
- Custom typography leverages the Afacad font bundled in `assets/fonts/` and declared in the project configuration.【F:pubspec.yaml†L107-L112】

- ## Contributing
1. Fork the repository and create a feature branch.
2. Make your changes with clear commit messages.
3. Open a pull request describing your updates and testing approach.

4. ## License
This project is currently unlicensed. Add your preferred license file (e.g., MIT, Apache 2.0) before distributing the app.
