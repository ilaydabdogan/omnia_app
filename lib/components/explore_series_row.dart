import 'package:flutter/material.dart';
import '../models/omni.dart';
import 'omni_series_card.dart';
import 'section_header.dart';

class ExploreSeriesRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Omni> series;
  final VoidCallback? onSeeMore;
  final Function(Omni)? onSeriesTap;

  const ExploreSeriesRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.series,
    this.onSeeMore,
    this.onSeriesTap,
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
        // Horizontal scrollable list of series cards
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const BouncingScrollPhysics(),
            itemCount: series.length,
            itemBuilder: (context, index) {
              final seriesItem = series[index];
              return OmniSeriesCard(
                series: seriesItem,
                height: 120,
                onTap: onSeriesTap != null ? () => onSeriesTap!(seriesItem) : null,
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