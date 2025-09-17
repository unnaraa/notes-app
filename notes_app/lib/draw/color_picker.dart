// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:notes_app/draw/color_pallete.dart';

class ColorPickerWidget extends StatelessWidget {
  final Color selectedColor;
  final Function(Color) onColorSelected;
  final VoidCallback onClear;

  const ColorPickerWidget({
    Key? key,
    required this.selectedColor,
    required this.onColorSelected,
    required this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.grey[900],
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          ...ColorPallete.colors.map(
            (color) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _buildColorButton(color),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              onPressed: onClear,
              icon: const Icon(Icons.clear, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorButton(Color color) {
    return GestureDetector(
      onTap: () => onColorSelected(color),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: selectedColor == color ? Colors.white : Colors.grey[800]!,
            width: 2,
          ),
          boxShadow: [
            if (selectedColor == color)
            BoxShadow(
              color: color.withOpacity(0.6),
              blurRadius: 8,
              spreadRadius: 1,
            )
          ]
        ),
      ),
    );
  }
}
