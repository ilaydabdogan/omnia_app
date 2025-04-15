import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SuitFilterBar extends StatefulWidget {
  final List<String> suits;
  final Function(String) onSuitSelected;
  final String initialSuit;

  const SuitFilterBar({
    super.key,
    required this.suits,
    required this.onSuitSelected,
    required this.initialSuit,
  });

  @override
  State<SuitFilterBar> createState() => _SuitFilterBarState();
}

class _SuitFilterBarState extends State<SuitFilterBar> {
  late String selectedSuit;

  @override
  void initState() {
    super.initState();
    selectedSuit = widget.initialSuit;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        itemCount: widget.suits.length,
        itemBuilder: (context, index) {
          final suit = widget.suits[index];
          final isSelected = suit == selectedSuit;
          
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSuit = suit;
              });
              widget.onSuitSelected(suit);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected 
                    ? AppTheme.primaryColor.withOpacity(0.08) 
                    : const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(20),
                border: isSelected
                    ? Border.all(color: AppTheme.primaryColor.withOpacity(0.3), width: 1.2)
                    : null,
              ),
              child: Text(
                suit,
                style: TextStyle(
                  color: isSelected ? AppTheme.primaryColor : AppTheme.subtitleColor,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
} 