import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:kinsen_ops/core/theme/app_theme.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceAssistantOverlay extends StatefulWidget {
  final VoidCallback onClose;

  const VoiceAssistantOverlay({super.key, required this.onClose});

  @override
  State<VoiceAssistantOverlay> createState() => _VoiceAssistantOverlayState();
}

class _VoiceAssistantOverlayState extends State<VoiceAssistantOverlay> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the mic and start speaking...';
  String _aiResponse = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
      _processVoiceCommand(_text);
    }
  }

  void _processVoiceCommand(String text) async {
    setState(() {
      _aiResponse = 'Processing intent...';
    });
    
    // Simulate AI NLP Processing
    await Future.delayed(const Duration(seconds: 1));
    
    if (text.toLowerCase().contains('damage') || text.toLowerCase().contains('tire')) {
       setState(() {
        _aiResponse = 'Identified context: Vehicle Maintenance.\\nAction: Moving ZXY-1234 to Maintenance. Notifying Ops Inbox.';
      });
    } else if (text.toLowerCase().contains('clean') || text.toLowerCase().contains('done')) {
       setState(() {
        _aiResponse = 'Identified context: Wash Complete.\\nAction: ZXY-1234 marked as Ready. Wash Task Closed.';
      });
    } else {
      setState(() {
        _aiResponse = 'Command transcribed and logged to General Chat.';
      });
    }

    // Auto-close after a few seconds
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        widget.onClose();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.8),
      child: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppTheme.surfaceGlass,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: AppTheme.primary.withOpacity(0.5), width: 2),
            boxShadow: [
              BoxShadow(color: AppTheme.primary.withOpacity(0.2), blurRadius: 40, spreadRadius: 10),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Ops Copilot', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold, fontSize: 18)),
                  IconButton(
                    icon: const Icon(LucideIcons.x, color: Colors.white),
                    onPressed: widget.onClose,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              AvatarGlow(
                animate: _isListening,
                glowColor: AppTheme.primary,
                duration: const Duration(milliseconds: 2000),
                repeat: true,
                child: GestureDetector(
                  onTap: _listen,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [AppTheme.primary, AppTheme.tertiary],
                      ),
                      boxShadow: [
                        BoxShadow(color: AppTheme.primary.withOpacity(0.5), blurRadius: 20),
                      ],
                    ),
                    child: Icon(
                      _isListening ? LucideIcons.mic : LucideIcons.micOff,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                _text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              if (_aiResponse.isNotEmpty) ...[
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.tertiary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.tertiary.withOpacity(0.5)),
                  ),
                  child: Row(
                    children: [
                      const Icon(LucideIcons.bot, color: AppTheme.tertiary),
                      const SizedBox(width: 12),
                      Expanded(child: Text(_aiResponse, style: const TextStyle(color: AppTheme.primaryLight, fontSize: 14))),
                    ],
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
