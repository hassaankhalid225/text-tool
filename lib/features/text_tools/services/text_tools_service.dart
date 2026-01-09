class TextToolsService {
  /// Converts text to uppercase
  String toUpperCase(String text) {
    return text.toUpperCase();
  }
  
  /// Converts text to lowercase
  String toLowerCase(String text) {
    return text.toLowerCase();
  }
  
  /// Converts text to title case (capitalizes first letter of each word)
  String toTitleCase(String text) {
    if (text.isEmpty) return text;
    
    return text.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
  
  /// Removes extra spaces (leading, trailing, and multiple spaces)
  String removeExtraSpaces(String text) {
    // Remove leading and trailing spaces
    String trimmed = text.trim();
    
    // Replace multiple spaces with single space
    return trimmed.replaceAll(RegExp(r'\s+'), ' ');
  }
  
  /// Reverses the text character by character
  String reverseText(String text) {
    return text.split('').reversed.join('');
  }
  
  /// Counts characters in text
  int countCharacters(String text) {
    return text.length;
  }
  
  /// Counts words in text
  int countWords(String text) {
    if (text.trim().isEmpty) return 0;
    return text.trim().split(RegExp(r'\s+')).length;
  }
  
  /// Counts lines in text
  int countLines(String text) {
    if (text.isEmpty) return 0;
    return text.split('\n').length;
  }
}
