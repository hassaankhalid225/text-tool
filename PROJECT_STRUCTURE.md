# Text Tools - Project Structure

## 📁 Directory Structure

```
text_tool/
│
├── android/                    # Android platform files
├── ios/                        # iOS platform files
├── web/                        # Web platform files
├── windows/                    # Windows platform files
│
├── lib/
│   ├── core/                   # Core app functionality
│   │   ├── constants/
│   │   │   └── app_constants.dart
│   │   ├── theme/
│   │   │   ├── app_colors.dart
│   │   │   └── app_theme.dart
│   │   └── providers/
│   │       └── theme_provider.dart
│   │
│   ├── features/               # Feature modules
│   │   └── text_tools/
│   │       ├── providers/
│   │       │   └── text_tools_provider.dart
│   │       ├── screens/
│   │       │   └── text_tools_screen.dart
│   │       ├── services/
│   │       │   └── text_tools_service.dart
│   │       └── widgets/
│   │           ├── action_button.dart
│   │           ├── text_input_card.dart
│   │           ├── output_card.dart
│   │           └── stats_card.dart
│   │
│   └── main.dart               # App entry point
│
├── test/                       # Unit and widget tests
├── pubspec.yaml               # Dependencies
└── README.md                  # Documentation
```

## 🎯 Module Responsibilities

### Core Module
**Purpose:** Shared functionality used across the app

- **constants/** - App-wide constants and strings
- **theme/** - Theme configuration and colors
- **providers/** - Global state management (theme)

### Features Module
**Purpose:** Feature-specific code organized by domain

#### Text Tools Feature
- **providers/** - Feature state management
- **screens/** - UI screens
- **services/** - Business logic and algorithms
- **widgets/** - Reusable UI components

## 🔄 Data Flow

```
User Input
    ↓
TextToolsScreen (UI)
    ↓
TextToolsProvider (State)
    ↓
TextToolsService (Logic)
    ↓
Output to UI
```

## 🎨 Widget Hierarchy

```
MaterialApp
└── TextToolsScreen
    ├── AppBar
    │   └── Theme Toggle Button
    ├── ScrollView
    │   ├── TextInputCard
    │   ├── StatsCard
    │   │   ├── Characters
    │   │   ├── Words
    │   │   └── Lines
    │   ├── Action Buttons
    │   │   ├── UPPERCASE
    │   │   ├── lowercase
    │   │   ├── Title Case
    │   │   ├── Remove Spaces
    │   │   ├── Reverse
    │   │   └── Clear
    │   ├── OutputCard
    │   └── Copy/Share Buttons
```

## 📦 Key Files

| File | Purpose |
|------|---------|
| `main.dart` | App initialization, provider setup |
| `app_theme.dart` | Light/dark theme configuration |
| `theme_provider.dart` | Theme state and persistence |
| `text_tools_service.dart` | Text manipulation algorithms |
| `text_tools_provider.dart` | UI state management |
| `text_tools_screen.dart` | Main screen UI |

## 🔌 Dependencies Map

```
main.dart
├── provider (state management)
├── core/theme/app_theme.dart
├── core/providers/theme_provider.dart
└── features/text_tools/
    ├── providers/text_tools_provider.dart
    │   ├── share_plus (sharing)
    │   └── services/text_tools_service.dart
    └── screens/text_tools_screen.dart
        └── widgets/
            ├── action_button.dart
            ├── text_input_card.dart
            ├── output_card.dart
            └── stats_card.dart
```

## 🎯 Design Patterns Used

1. **Provider Pattern** - State management
2. **Service Pattern** - Business logic separation
3. **Widget Composition** - Reusable UI components
4. **Separation of Concerns** - Clear module boundaries

## 📝 Naming Conventions

- **Files:** snake_case (e.g., `text_tools_screen.dart`)
- **Classes:** PascalCase (e.g., `TextToolsProvider`)
- **Variables:** camelCase (e.g., `textController`)
- **Constants:** camelCase with static const (e.g., `AppConstants.appName`)

## 🚀 Adding New Features

1. Create feature folder: `lib/features/new_feature/`
2. Add subdirectories: `providers/`, `screens/`, `services/`, `widgets/`
3. Implement service layer first (business logic)
4. Create provider for state management
5. Build UI components
6. Register provider in `main.dart`
7. Update navigation if needed

## 🧪 Testing Structure

```
test/
├── unit/
│   ├── services/
│   │   └── text_tools_service_test.dart
│   └── providers/
│       └── text_tools_provider_test.dart
└── widget/
    └── screens/
        └── text_tools_screen_test.dart
```

## 📊 State Management Flow

```
User Action
    ↓
Widget calls Provider method
    ↓
Provider updates state
    ↓
Provider calls Service
    ↓
Service returns result
    ↓
Provider notifyListeners()
    ↓
UI rebuilds with new state
```

---

This modular structure ensures:
- ✅ Easy to maintain
- ✅ Easy to test
- ✅ Easy to scale
- ✅ Clear separation of concerns
- ✅ Reusable components
