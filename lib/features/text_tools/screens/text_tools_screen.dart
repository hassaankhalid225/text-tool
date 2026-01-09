import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/text_tools_provider.dart';
import '../widgets/action_button.dart';
import '../widgets/text_input_card.dart';
import '../widgets/output_card.dart';
import '../widgets/stats_card.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/providers/theme_provider.dart';

class TextToolsScreen extends StatelessWidget {
  const TextToolsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return IconButton(
                icon: Icon(
                  themeProvider.isDarkMode 
                    ? Icons.light_mode 
                    : Icons.dark_mode,
                ),
                onPressed: () => themeProvider.toggleTheme(),
                tooltip: 'Toggle Theme',
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Input Section
              Consumer<TextToolsProvider>(
                builder: (context, provider, child) {
                  return TextInputCard(
                    controller: provider.textController,
                    hint: AppConstants.enterTextHint,
                  );
                },
              ),
              
              const SizedBox(height: 16),
              
              // Stats Section
              Consumer<TextToolsProvider>(
                builder: (context, provider, child) {
                  return StatsCard(
                    characters: provider.characterCount,
                    words: provider.wordCount,
                    lines: provider.lineCount,
                  );
                },
              ),
              
              const SizedBox(height: 24),
              
              // Action Buttons Section
              Consumer<TextToolsProvider>(
                builder: (context, provider, child) {
                  return Column(
                    children: [
                      // Row 1
                      Row(
                        children: [
                          Expanded(
                            child: ActionButton(
                              label: AppConstants.toUppercase,
                              onPressed: provider.toUpperCase,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ActionButton(
                              label: AppConstants.toLowercase,
                              onPressed: provider.toLowerCase,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Row 2
                      ActionButton(
                        label: AppConstants.toTitleCase,
                        onPressed: provider.toTitleCase,
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Row 3
                      ActionButton(
                        label: AppConstants.removeExtraSpaces,
                        onPressed: provider.removeExtraSpaces,
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Row 4
                      ActionButton(
                        label: AppConstants.reverseText,
                        onPressed: provider.reverseText,
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Row 5
                      ActionButton(
                        label: AppConstants.clearText,
                        onPressed: provider.clearText,
                        icon: Icons.clear,
                      ),
                    ],
                  );
                },
              ),
              
              const SizedBox(height: 24),
              
              // Output Section
              Consumer<TextToolsProvider>(
                builder: (context, provider, child) {
                  return OutputCard(
                    text: provider.outputText,
                    label: AppConstants.outputLabel,
                  );
                },
              ),
              
              const SizedBox(height: 16),
              
              // Copy & Share Buttons
              Consumer<TextToolsProvider>(
                builder: (context, provider, child) {
                  return Row(
                    children: [
                      Expanded(
                        child: ActionButton(
                          label: AppConstants.copyText,
                          onPressed: () => provider.copyToClipboard(context),
                          icon: Icons.copy,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ActionButton(
                          label: AppConstants.shareText,
                          onPressed: provider.shareText,
                          icon: Icons.share,
                        ),
                      ),
                    ],
                  );
                },
              ),
              
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
