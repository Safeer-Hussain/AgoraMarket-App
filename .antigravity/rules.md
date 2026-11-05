# Autonomous Engineering Rules & Guidelines

## 1. Zero Emoji Policy (Strictly Enforced)
- Never use emojis anywhere in source code, comments, UI text, error messages, debug logs, documentation, or git commit messages.
- Use vector Material Symbols, Cupertino icons, or Lucide icons exclusively for visual iconography.

## 2. Autonomous Daily Sprint Execution Protocol
- When instructed to execute or when operating autonomously, proceed through the 25 daily sprints outlined in `docs/AUTONOMOUS_BACKLOG.md`.
- After each sprint or feature increment, execute `flutter analyze` and `flutter test` to ensure zero static warnings and 100% test pass rates before committing.
- Commit each atomic increment with a conventional commit message following standard semantic formatting without emojis (e.g., `feat(feed): implement sub-second canvas reel renderer`).

## 3. Architecture & Code Hygiene
- Enforce Feature-First Clean Architecture combined with Model-View-ViewModel (MVVM):
  - `core/`: Constants, database, dependency injection, networking, performance, theme, utilities.
  - `data/`: Models, SQLite repositories, local data sources.
  - `domain/`: Pure Dart entities and repository contracts.
  - `presentation/`: Views, ViewModels (ChangeNotifier Providers), and modular UI widgets.
- Primary State Management: `Provider` (`ChangeNotifierProvider`, `Consumer`, `Selector`).
- Dependency Injection: `GetIt` (`sl`).
- Local Persistence: `sqflite` for relational entities and `SharedPreferences` for settings.

## 4. UI, Theming & Viewport Safety Rules
- Zero Hardcoded Colors: Resolve all colors dynamically through `Theme.of(context).colorScheme`.
- Unique Hero Tags: Explicitly define unique `heroTag` strings on every `FloatingActionButton` across all views.
- Landscape 360dp Viewport Safety:
  - Transition bottom navigation to a compact `NavigationRail` (`minWidth: 56`, no bulky headers).
  - Use compact `AppBar` with `toolbarHeight: 36`.
  - Implement two-pane master-detail screens with independent vertical `SingleChildScrollView` controllers.
  - In grids, specify explicit `mainAxisExtent: 145` rather than fragile aspect ratios.
- Keyboard Handling: Wrap root in an unfocusing `GestureDetector` and use `keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag`. Avoid double-applying bottom view insets in resizing scaffolds.

## 5. Offline-First & Sub-8ms Performance Engine
- No external paid APIs or Firebase dependencies.
- Use `Dio` with `MockApiInterceptor` backed by `sqflite` and `SharedPreferences`.
- Monitor frame times using `RenderLatencyMonitor` via `SchedulerBinding.addTimingsCallback` to sustain sub-8ms / 120 FPS frame rates.
