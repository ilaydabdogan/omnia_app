import 'package:flutter/material.dart';
import '../models/omni.dart';
import 'omni_card.dart';
import 'section_header.dart';

class ExploreCategoryRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Omni> omnis;
  final VoidCallback? onSeeMore;
  final Function(Omni)? onOmniTap;

  const ExploreCategoryRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.omnis,
    this.onSeeMore,
    this.onOmniTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        SectionHeader(
          title: title,
          subtitle: subtitle,
          onSeeMore: onSeeMore,
        ),
        // Horizontal scrollable list of cards
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const BouncingScrollPhysics(),
            itemCount: omnis.length,
            itemBuilder: (context, index) {
              final omni = omnis[index];
              return OmniCard(
                omni: omni,
                onTap: onOmniTap != null ? () => onOmniTap!(omni) : null,
              );
            },
          ),
        ),
        // Add a small bottom margin
        const SizedBox(height: 8),
      ],
    );
  }
} 