import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: XylophoneScreen(),
    );
  }
}

class XylophoneScreen extends StatelessWidget {
  const XylophoneScreen({super.key});

  static final AudioCache _audioCache = AudioCache(prefix: 'assets/');

  static const List<_XylophoneKeyData> _keys = [
    _XylophoneKeyData(color: Color(0xFFF44336), noteNumber: 1),
    _XylophoneKeyData(
      color: Color(0xFFFFEB3B),
      noteNumber: 2,
      textColor: Colors.black87,
    ),
    _XylophoneKeyData(color: Color(0xFF4CAF50), noteNumber: 3),
    _XylophoneKeyData(
      color: Color(0xFFCDDC39),
      noteNumber: 4,
      textColor: Colors.black87,
    ),
    _XylophoneKeyData(color: Color(0xFF795548), noteNumber: 5),
    _XylophoneKeyData(color: Color(0xFF4F86F7), noteNumber: 6),
    _XylophoneKeyData(color: Color(0xFF9C27B0), noteNumber: 7),
  ];

  void _playNote(int noteNumber) {
    _audioCache.play('note$noteNumber.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _keys
              .map(
                (key) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 1.5,
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: key.color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: () => _playNote(key.noteNumber),
                      child: Text(
                        'Xylophone',
                        style: TextStyle(
                          color: key.textColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _XylophoneKeyData {
  const _XylophoneKeyData({
    required this.color,
    required this.noteNumber,
    this.textColor = Colors.white,
  });

  final Color color;
  final int noteNumber;
  final Color textColor;
}
