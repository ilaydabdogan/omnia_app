import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';
import '../components/explore_category_row.dart';
import '../components/explore_series_row.dart';
import '../components/featured_omni_header.dart';
import '../components/suit_filter_bar.dart';
import '../models/omni.dart';
import '../theme/app_theme.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<String> _suits = ['Mind', 'Life', 'Heart', 'Self', 'Wildcard'];
  String _selectedSuit = 'Life';
  
  // Sample data
  late List<Omni> _allOmnis;
  late List<Omni> _series;
  late List<Omni> _featuredOmnis;
  
  @override
  void initState() {
    super.initState();
    _allOmnis = Omni.getSampleOmnis();
    _series = Omni.getSampleSeries();
    _featuredOmnis = Omni.getFeaturedOmnis();
  }
  
  // Filter omnis by suit
  List<Omni> _getFilteredOmnis(String suit) {
    if (suit == 'All') {
      return _allOmnis;
    }
    return _allOmnis.where((omni) => omni.suit == suit).toList();
  }
  
  // Handle omni tap
  void _handleOmniTap(Omni omni) {
    // Will implement later for navigation to Omni detail page
    debugPrint('Tapped on ${omni.title}');
  }
  
  // Bottom nav tap
  void _onBottomNavTap(int index) {
    // Will implement later for navigation between main screens
    debugPrint('Bottom nav tapped: $index');
  }

  @override
  Widget build(BuildContext context) {
    // Get filtered omnis based on selected suit
    final filteredOmnis = _getFilteredOmnis(_selectedSuit);
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      // App Bar
      appBar: AppBar(
        title: const Text('Explore'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 26),
            onPressed: () {
              // Will implement search later
              debugPrint('Search tapped');
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      // Body
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Sticky filter bar at the top
            SuitFilterBar(
              suits: _suits,
              initialSuit: _selectedSuit,
              onSuitSelected: (suit) {
                setState(() {
                  _selectedSuit = suit;
                });
              },
            ),
            
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 100 + bottomPadding), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Popular This Week
                      ExploreCategoryRow(
                        title: 'Popular This Week',
                        subtitle: 'Trending experiences loved by our community',
                        omnis: filteredOmnis.where((o) => o.tag == 'Popular').toList(),
                        onOmniTap: _handleOmniTap,
                        onSeeMore: () => debugPrint('See more Popular'),
                      ),
                      
                      // Featured Journeys (Series)
                      ExploreSeriesRow(
                        title: 'Featured Journeys',
                        subtitle: 'Multi-part experiences for deeper transformation',
                        series: _series,
                        onSeriesTap: _handleOmniTap,
                        onSeeMore: () => debugPrint('See more Journeys'),
                      ),
                      
                      // Gentle Healing
                      ExploreCategoryRow(
                        title: 'Gentle Healing',
                        subtitle: 'Soft approaches to emotional wellness and recovery',
                        omnis: filteredOmnis.where((o) => 
                            o.title.contains('Let It Out') || 
                            o.title.contains('Emotional')
                        ).toList(),
                        onOmniTap: _handleOmniTap,
                        onSeeMore: () => debugPrint('See more Gentle Healing'),
                      ),
                      
                      // Get Instant Clarity
                      ExploreCategoryRow(
                        title: 'Get Instant Clarity',
                        subtitle: 'Quick exercises for mental focus and decision making',
                        omnis: filteredOmnis.where((o) => 
                            o.title.contains('Clarity') || 
                            o.title.contains('Time') ||
                            o.title.contains('Emotional')
                        ).toList(),
                        onOmniTap: _handleOmniTap,
                        onSeeMore: () => debugPrint('See more Clarity'),
                      ),
                      
                      // Fun & Weird
                      ExploreCategoryRow(
                        title: 'Fun & Weird',
                        subtitle: 'Playful experiences that spark joy and curiosity',
                        omnis: filteredOmnis.where((o) => 
                            o.title.contains('Quantum') || 
                            o.title.contains('Dream') ||
                            o.title.contains('Date') ||
                            o.title.contains('Cosmic')
                        ).toList(),
                        onOmniTap: _handleOmniTap,
                        onSeeMore: () => debugPrint('See more Fun & Weird'),
                      ),
                      
                      // Self Discovery
                      ExploreCategoryRow(
                        title: 'Self Discovery',
                        subtitle: 'Deep dive into who you really are',
                        omnis: filteredOmnis.where((o) => 
                            o.suit == 'Self' ||
                            o.title.contains('Inner') ||
                            o.title.contains('Shadow')
                        ).toList(),
                        onOmniTap: _handleOmniTap,
                        onSeeMore: () => debugPrint('See more Self Discovery'),
                      ),
                      
                      // Featured Omnis header (below categories)
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Featured Omnis',
                          style: AppTheme.headingStyle,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Experiences curated for deeper transformation',
                          style: AppTheme.subheadingStyle,
                        ),
                      ),
                      const SizedBox(height: 16),
                      FeaturedOmniHeader(
                        omnis: _featuredOmnis,
                        onOmniTap: _handleOmniTap,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // Explore is selected
        onTap: _onBottomNavTap,
      ),
    );
  }
} 