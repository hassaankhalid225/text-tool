import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import '../services/text_tools_service.dart';

class TextToolsProvider extends ChangeNotifier {
  final TextToolsService _textToolsService = TextToolsService();
  final TextEditingController textController = TextEditingController();
  
  String _outputText = '';
  
  String get outputText => _outputText;
  
  int get characterCount => _textToolsService.countCharacters(textController.text);
  int get wordCount => _textToolsService.countWords(textController.text);
  int get lineCount => _textToolsService.countLines(textController.text);
  
  TextToolsProvider() {
    textController.addListener(_onTextChanged);
  }
  
  void _onTextChanged() {
    _outputText = textController.text;
    notifyListeners();
  }
  
  /// Convert to uppercase
  void toUpperCase() {
    if (textController.text.isEmpty) return;
    _outputText = _textToolsService.toUpperCase(textController.text);
    notifyListeners();
  }
  
  /// Convert to lowercase
  void toLowerCase() {
    if (textController.text.isEmpty) return;
    _outputText = _textToolsService.toLowerCase(textController.text);
    notifyListeners();
  }
  
  /// Convert to title case
  void toTitleCase() {
    if (textController.text.isEmpty) return;
    _outputText = _textToolsService.toTitleCase(textController.text);
    notifyListeners();
  }
  
  /// Remove extra spaces
  void removeExtraSpaces() {
    if (textController.text.isEmpty) return;
    _outputText = _textToolsService.removeExtraSpaces(textController.text);
    textController.text = _outputText;
    notifyListeners();
  }
  
  /// Reverse text
  void reverseText() {
    if (textController.text.isEmpty) return;
    _outputText = _textToolsService.reverseText(textController.text);
    notifyListeners();
  }
  
  /// Clear all text
  void clearText() {
    textController.clear();
    _outputText = '';
    notifyListeners();
  }
  
  /// Copy output text to clipboard
  Future<void> copyToClipboard(BuildContext context) async {
    if (_outputText.isEmpty) return;
    
    await Clipboard.setData(ClipboardData(text: _outputText));
    
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Text copied'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
  
  /// Share text
  Future<void> shareText() async {
    if (_outputText.isEmpty) return;
    
    await Share.share(_outputText);
  }
  
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
