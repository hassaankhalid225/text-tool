# Text Tools - Visual Architecture Diagram

## 🏗️ Application Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                         Text Tools App                          │
│                         (main.dart)                             │
└─────────────────────────────────────────────────────────────────┘
                                │
                    ┌───────────┴───────────┐
                    │                       │
            ┌───────▼────────┐     ┌───────▼────────┐
            │ ThemeProvider  │     │TextToolsProvider│
            │  (Dark/Light)  │     │  (Text State)   │
            └───────┬────────┘     └───────┬─────────┘
                    │                      │
                    └──────────┬───────────┘
                               │
                    ┌──────────▼───────────┐
                    │  TextToolsScreen     │
                    │   (Main UI)          │
                    └──────────┬───────────┘
                               │
        ┌──────────────────────┼──────────────────────┐
        │                      │                      │
┌───────▼────────┐   ┌────────▼────────┐   ┌────────▼────────┐
│  Input Card    │   │   Stats Card    │   │  Output Card    │
│  (TextField)   │   │ (Char/Word/Line)│   │ (SelectableText)│
└────────────────┘   └─────────────────┘   └─────────────────┘
        │
        │
┌───────▼────────────────────────────────────────────────────────┐
│                    Action Buttons                               │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐       │
│  │UPPERCASE │  │lowercase │  │TitleCase │  │  Remove  │       │
│  └──────────┘  └──────────┘  └──────────┘  │  Spaces  │       │
│  ┌──────────┐  ┌──────────┐                └──────────┘       │
│  │ Reverse  │  │  Clear   │                                    │
│  └──────────┘  └──────────┘                                    │
└────────────────────────────────────────────────────────────────┘
        │
        │
┌───────▼────────────────────────────────────────────────────────┐
│                 Copy & Share Buttons                            │
│       ┌──────────┐              ┌──────────┐                   │
│       │   Copy   │              │  Share   │                   │
│       └──────────┘              └──────────┘                   │
└────────────────────────────────────────────────────────────────┘
```

## 📊 Data Flow Diagram

```
┌─────────────┐
│    User     │
│   Input     │
└──────┬──────┘
       │
       ▼
┌─────────────────────────────────┐
│      TextEditingController      │
│    (Managed by Provider)        │
└──────┬──────────────────────────┘
       │
       ▼
┌─────────────────────────────────┐
│    TextToolsProvider            │
│  - Listens to text changes      │
│  - Updates statistics           │
│  - Manages state                │
└──────┬──────────────────────────┘
       │
       ▼
┌─────────────────────────────────┐
│    User Taps Action Button      │
└──────┬──────────────────────────┘
       │
       ▼
┌─────────────────────────────────┐
│    Provider calls Service       │
└──────┬──────────────────────────┘
       │
       ▼
┌─────────────────────────────────┐
│    TextToolsService             │
│  - toUpperCase()                │
│  - toLowerCase()                │
│  - toTitleCase()                │
│  - removeExtraSpaces()          │
│  - reverseText()                │
└──────┬──────────────────────────┘
       │
       ▼
┌─────────────────────────────────┐
│    Returns Transformed Text     │
└──────┬──────────────────────────┘
       │
       ▼
┌─────────────────────────────────┐
│    Provider updates _outputText │
│    Calls notifyListeners()      │
└──────┬──────────────────────────┘
       │
       ▼
┌─────────────────────────────────┐
│    UI Rebuilds (Consumer)       │
│    Shows new output             │
└─────────────────────────────────┘
```

## 🎨 Theme System Flow

```
┌─────────────────────────────────┐
│    User Taps Theme Toggle       │
└──────┬──────────────────────────┘
       │
       ▼
┌─────────────────────────────────┐
│    ThemeProvider.toggleTheme()  │
└──────┬──────────────────────────┘
       │
       ├──────────────┬─────────────┐
       │              │             │
       ▼              ▼             ▼
┌──────────┐   ┌──────────┐   ┌──────────┐
│  Update  │   │   Save   │   │  Notify  │
│  State   │   │   to     │   │Listeners │
│          │   │SharedPref│   │          │
└──────────┘   └──────────┘   └──────────┘
       │              │             │
       └──────────────┴─────────────┘
                      │
                      ▼
       ┌──────────────────────────────┐
       │    MaterialApp Rebuilds      │
       │    with new ThemeMode        │
       └──────────────────────────────┘
                      │
                      ▼
       ┌──────────────────────────────┐
       │    Entire App Re-renders     │
       │    with new theme            │
       └──────────────────────────────┘
```

## 🗂️ Module Dependencies

```
main.dart
├── provider (package)
├── core/
│   ├── theme/
│   │   ├── app_theme.dart
│   │   └── app_colors.dart
│   ├── constants/
│   │   └── app_constants.dart
│   └── providers/
│       └── theme_provider.dart
│           └── shared_preferences (package)
└── features/
    └── text_tools/
        ├── screens/
        │   └── text_tools_screen.dart
        ├── providers/
        │   └── text_tools_provider.dart
        │       ├── flutter/services (Clipboard)
        │       └── share_plus (package)
        ├── services/
        │   └── text_tools_service.dart
        └── widgets/
            ├── action_button.dart
            ├── text_input_card.dart
            ├── output_card.dart
            └── stats_card.dart
```

## 🔄 Widget Tree

```
MaterialApp
└── MultiProvider
    ├── ThemeProvider
    └── TextToolsProvider
        └── Consumer<ThemeProvider>
            └── TextToolsScreen
                ├── AppBar
                │   ├── Text (Title)
                │   └── Consumer<ThemeProvider>
                │       └── IconButton (Theme Toggle)
                │
                └── SafeArea
                    └── SingleChildScrollView
                        └── Column
                            ├── Consumer<TextToolsProvider>
                            │   └── TextInputCard
                            │       └── Card
                            │           └── TextField
                            │
                            ├── Consumer<TextToolsProvider>
                            │   └── StatsCard
                            │       └── Card
                            │           └── Row
                            │               ├── _StatItem (Characters)
                            │               ├── _VerticalDivider
                            │               ├── _StatItem (Words)
                            │               ├── _VerticalDivider
                            │               └── _StatItem (Lines)
                            │
                            ├── Consumer<TextToolsProvider>
                            │   └── Column (Action Buttons)
                            │       ├── Row
                            │       │   ├── ActionButton (UPPERCASE)
                            │       │   └── ActionButton (lowercase)
                            │       ├── ActionButton (Title Case)
                            │       ├── ActionButton (Remove Spaces)
                            │       ├── ActionButton (Reverse)
                            │       └── ActionButton (Clear)
                            │
                            ├── Consumer<TextToolsProvider>
                            │   └── OutputCard
                            │       └── Card
                            │           └── SelectableText
                            │
                            └── Consumer<TextToolsProvider>
                                └── Row
                                    ├── ActionButton (Copy)
                                    └── ActionButton (Share)
```

## 📦 State Management Pattern

```
┌─────────────────────────────────────────────────────────────┐
│                      Provider Pattern                        │
└─────────────────────────────────────────────────────────────┘

1. Provider Setup (main.dart):
   MultiProvider([
     ThemeProvider,
     TextToolsProvider
   ])

2. State Access (UI):
   Consumer<TextToolsProvider>(
     builder: (context, provider, child) {
       return Widget(provider.data);
     }
   )

3. State Update (Provider):
   void updateState() {
     _state = newValue;
     notifyListeners(); // Triggers rebuild
   }

4. UI Rebuild:
   Only Consumer widgets rebuild,
   not the entire tree
```

## 🎯 Feature Isolation

```
features/
└── text_tools/              ← Feature Module
    ├── providers/           ← State Management
    │   └── text_tools_provider.dart
    │
    ├── services/            ← Business Logic
    │   └── text_tools_service.dart
    │
    ├── screens/             ← UI Screens
    │   └── text_tools_screen.dart
    │
    └── widgets/             ← Reusable Components
        ├── action_button.dart
        ├── text_input_card.dart
        ├── output_card.dart
        └── stats_card.dart

Benefits:
✅ Clear separation
✅ Easy to test
✅ Easy to maintain
✅ Reusable components
✅ Scalable structure
```

## 🔐 Privacy Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                      User's Device                           │
│  ┌────────────────────────────────────────────────────────┐ │
│  │              Text Tools App                            │ │
│  │                                                        │ │
│  │  ┌──────────────────────────────────────────────────┐ │ │
│  │  │  Text Processing (100% Local)                    │ │ │
│  │  │  - All transformations done on device            │ │ │
│  │  │  - No data sent to servers                       │ │ │
│  │  │  - No internet connection required               │ │ │
│  │  └──────────────────────────────────────────────────┘ │ │
│  │                                                        │ │
│  │  ┌──────────────────────────────────────────────────┐ │ │
│  │  │  Local Storage (SharedPreferences)               │ │ │
│  │  │  - Only stores theme preference                  │ │ │
│  │  │  - No sensitive data                             │ │ │
│  │  └──────────────────────────────────────────────────┘ │ │
│  │                                                        │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                             │
│  ❌ No Internet Connection                                  │
│  ❌ No External APIs                                         │
│  ❌ No Analytics                                             │
│  ❌ No Data Collection                                       │
└─────────────────────────────────────────────────────────────┘
```

## 📱 Screen Layout

```
┌─────────────────────────────────────────┐
│  Text Tools            [🌙]             │  ← AppBar
├─────────────────────────────────────────┤
│                                         │
│  ┌───────────────────────────────────┐  │
│  │  Enter text                       │  │  ← Input Card
│  │                                   │  │
│  │                                   │  │
│  └───────────────────────────────────┘  │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │  📝 123  │  📄 45  │  📋 6        │  │  ← Stats Card
│  │Characters│  Words  │  Lines       │  │
│  └───────────────────────────────────┘  │
│                                         │
│  ┌─────────────┐  ┌─────────────────┐  │
│  │  UPPERCASE  │  │   lowercase     │  │  ← Action Buttons
│  └─────────────┘  └─────────────────┘  │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │       Title Case                  │  │
│  └───────────────────────────────────┘  │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │    REMOVE EXTRA SPACES            │  │
│  └───────────────────────────────────┘  │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │       REVERSE TEXT                │  │
│  └───────────────────────────────────┘  │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │  🗑️  Clear Text                   │  │
│  └───────────────────────────────────┘  │
│                                         │
│  ┌───────────────────────────────────┐  │
│  │  Output                           │  │  ← Output Card
│  │  Transformed text appears here    │  │
│  └───────────────────────────────────┘  │
│                                         │
│  ┌─────────────┐  ┌─────────────────┐  │
│  │  📋 Copy    │  │  🔗 Share       │  │  ← Copy/Share
│  └─────────────┘  └─────────────────┘  │
│                                         │
└─────────────────────────────────────────┘
```

---

**This visual architecture demonstrates:**
- ✅ Clean separation of concerns
- ✅ Modular component structure
- ✅ Efficient state management
- ✅ Privacy-first design
- ✅ Scalable architecture
