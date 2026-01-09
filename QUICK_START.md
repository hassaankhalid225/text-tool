# Quick Start Guide - Text Tools App

## 🚀 Running the App

### Option 1: Using Android Device/Emulator

1. **Connect your Android device** or **start an emulator**

2. **Run the app:**
   ```bash
   flutter run
   ```

3. **Hot reload** during development: Press `r` in terminal

4. **Hot restart**: Press `R` in terminal

### Option 2: Using Windows

```bash
flutter run -d windows
```

### Option 3: Using Web Browser

```bash
flutter run -d chrome
```

## 📱 Building for Production

### Android APK (for testing)
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

### Android App Bundle (for Play Store)
```bash
flutter build appbundle --release
```
Output: `build/app/outputs/bundle/release/app-release.aab`

## 🎨 Using the App

### Basic Workflow

1. **Enter Text**
   - Tap the input field
   - Type or paste your text

2. **Apply Transformations**
   - Tap any action button (UPPERCASE, lowercase, etc.)
   - Output appears in the output section

3. **View Statistics**
   - Character, word, and line counts update automatically

4. **Copy or Share**
   - Tap "Copy" to copy output to clipboard
   - Tap "Share" to share via system share sheet

5. **Toggle Theme**
   - Tap the sun/moon icon in the app bar
   - Theme preference is saved automatically

### Available Tools

| Tool | Function | Example |
|------|----------|---------|
| **TO UPPERCASE** | Converts all to capitals | hello → HELLO |
| **TO LOWERCASE** | Converts all to lowercase | HELLO → hello |
| **Title Case** | Capitalizes each word | hello world → Hello World |
| **REMOVE EXTRA SPACES** | Removes extra whitespace | "  hello   world  " → "hello world" |
| **REVERSE TEXT** | Reverses character order | hello → olleh |
| **Clear Text** | Clears all input | - |

## 🛠️ Development Commands

### Check for issues
```bash
flutter analyze
```

### Run tests
```bash
flutter test
```

### Clean build
```bash
flutter clean
flutter pub get
flutter run
```

### Update dependencies
```bash
flutter pub upgrade
```

## 📂 Project Files

### Main Files
- `lib/main.dart` - App entry point
- `lib/features/text_tools/screens/text_tools_screen.dart` - Main screen

### Configuration
- `pubspec.yaml` - Dependencies and app config
- `android/app/build.gradle` - Android build config

### Documentation
- `README.md` - Full documentation
- `PROJECT_STRUCTURE.md` - Architecture details
- `QUICK_START.md` - This file

## 🎯 Common Tasks

### Change App Name
Edit `pubspec.yaml`:
```yaml
name: your_app_name
```

### Change App Display Name (Android)
Edit `android/app/src/main/AndroidManifest.xml`:
```xml
<application
    android:label="Your App Name"
    ...>
```

### Add New Text Tool

1. **Add to service** (`lib/features/text_tools/services/text_tools_service.dart`):
```dart
String yourNewTool(String text) {
  // Your logic here
  return transformedText;
}
```

2. **Add to provider** (`lib/features/text_tools/providers/text_tools_provider.dart`):
```dart
void yourNewTool() {
  if (textController.text.isEmpty) return;
  _outputText = _textToolsService.yourNewTool(textController.text);
  notifyListeners();
}
```

3. **Add button to screen** (`lib/features/text_tools/screens/text_tools_screen.dart`):
```dart
ActionButton(
  label: 'Your Tool',
  onPressed: provider.yourNewTool,
),
```

## 🐛 Troubleshooting

### App won't build
```bash
flutter clean
flutter pub get
flutter run
```

### Dependency issues
```bash
flutter pub upgrade --major-versions
```

### Android build fails
```bash
cd android
./gradlew clean
cd ..
flutter run
```

### Theme not persisting
- Check if `shared_preferences` is properly installed
- Clear app data and reinstall

## 📱 Testing on Real Device

### Android
1. Enable Developer Options on your device
2. Enable USB Debugging
3. Connect via USB
4. Run `flutter devices` to verify
5. Run `flutter run`

### Wireless Debugging (Android 11+)
1. Enable Wireless Debugging in Developer Options
2. Pair device: `adb pair <ip>:<port>`
3. Connect: `adb connect <ip>:<port>`
4. Run `flutter run`

## 🎨 Customizing Theme

### Change Colors
Edit `lib/core/theme/app_colors.dart`:
```dart
static const Color lightPrimary = Color(0xFFYourColor);
```

### Modify Button Style
Edit `lib/core/theme/app_theme.dart`:
```dart
elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    // Your customizations
  ),
),
```

## 📊 Performance Tips

1. **Use const widgets** where possible
2. **Avoid rebuilding entire tree** - Provider handles this
3. **Test on real devices** for accurate performance
4. **Profile the app**: `flutter run --profile`

## 🔍 Debugging

### Enable debug mode
```bash
flutter run --debug
```

### View logs
```bash
flutter logs
```

### Debug in VS Code
- Set breakpoints
- Press F5
- Use Debug Console

### Debug in Android Studio
- Set breakpoints
- Click Debug button
- Use Debug panel

## ✅ Pre-Release Checklist

- [ ] Run `flutter analyze` - no issues
- [ ] Run `flutter test` - all tests pass
- [ ] Test on multiple devices
- [ ] Test dark and light themes
- [ ] Test all text tools
- [ ] Test copy and share functionality
- [ ] Update version in `pubspec.yaml`
- [ ] Build release APK/AAB
- [ ] Test release build

## 📞 Need Help?

- Check `README.md` for detailed documentation
- Review `PROJECT_STRUCTURE.md` for architecture
- Check Flutter docs: https://flutter.dev/docs
- Check Provider docs: https://pub.dev/packages/provider

---

**Happy Coding! 🚀**
