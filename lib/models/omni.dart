class Omni {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String suit; // e.g., "Mind", "Life", "Heart"
  final String? tag; // "New", "Popular", null
  final String? emoji; // Optional emoji indicator ✨🌀💡🧭🪞
  final bool isSeries;
  final int? seriesCount;

  Omni({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.suit,
    this.tag,
    this.emoji,
    this.isSeries = false,
    this.seriesCount,
  });

  // Simulated data for sample Omnis
  static List<Omni> getSampleOmnis() {
    return [
      Omni(
        id: '1',
        title: 'Quantum You',
        subtitle: 'Explore parallel life paths',
        imageUrl: 'assets/images/quantum_you.jpg', // Replace with actual path
        suit: 'Mind',
        tag: 'New',
      ),
      Omni(
        id: '2',
        title: 'Dream Decoder',
        subtitle: 'Unlock your subconscious',
        imageUrl: 'assets/images/dream_decoder.jpg',
        suit: 'Mind',
      ),
      Omni(
        id: '3',
        title: 'Inner Mirror',
        subtitle: 'See yourself with clarity',
        imageUrl: 'assets/images/inner_mirror.jpg',
        suit: 'Self',
        emoji: '🪞',
      ),
      Omni(
        id: '4',
        title: 'Authentic Voice',
        subtitle: 'Speak your truth confidently',
        imageUrl: 'assets/images/authentic_voice.jpg',
        suit: 'Self',
      ),
      Omni(
        id: '5',
        title: 'Let It Out, Lovingly',
        subtitle: 'For processing what\'s hard',
        imageUrl: 'assets/images/let_it_out.jpg',
        suit: 'Heart',
        tag: 'New',
      ),
      Omni(
        id: '6',
        title: 'Emotional Weather',
        subtitle: 'Track and understand your patterns',
        imageUrl: 'assets/images/emotional_weather.jpg',
        suit: 'Heart',
      ),
      Omni(
        id: '7',
        title: 'Date Roast',
        subtitle: 'For fun or deep compatibility checks',
        imageUrl: 'assets/images/date_roast.jpg',
        suit: 'Life',
      ),
      Omni(
        id: '8',
        title: 'Career Pathfinder',
        subtitle: 'Align work with your values',
        imageUrl: 'assets/images/career_pathfinder.jpg',
        suit: 'Life',
      ),
      Omni(
        id: '9',
        title: 'Cosmic Connections',
        subtitle: 'Find meaning in synchronicities',
        imageUrl: 'assets/images/cosmic_connections.jpg',
        suit: 'Wildcard',
        tag: 'New',
      ),
      Omni(
        id: '10',
        title: 'Dinner Designer',
        subtitle: 'Reimagine your eating habits',
        imageUrl: 'assets/images/dinner_designer.jpg',
        suit: 'Life',
      ),
      Omni(
        id: '11',
        title: 'Time Management for Mortals',
        subtitle: 'Master your precious hours',
        imageUrl: 'assets/images/time_management.jpg',
        suit: 'Life',
      ),
      Omni(
        id: '12',
        title: 'Shadow Work',
        subtitle: 'Embrace all parts of yourself',
        imageUrl: 'assets/images/shadow_work.jpg',
        suit: 'Self',
        tag: 'Popular',
      ),
      Omni(
        id: '13',
        title: 'Clarity Compass',
        subtitle: 'Navigate your thoughts with direction',
        imageUrl: 'assets/images/clarity_compass.jpg',
        suit: 'Mind',
      ),
    ];
  }

  // Featured Omnis for the header section
  static List<Omni> getFeaturedOmnis() {
    return [
      Omni(
        id: 'f1',
        title: 'Time Management for Mortals',
        subtitle: 'Master your precious hours',
        imageUrl: 'assets/images/time_management.jpg',
        suit: 'Life',
        tag: 'Popular',
      ),
      Omni(
        id: 'f2',
        title: 'Dream Decoder',
        subtitle: 'Unlock your subconscious mind',
        imageUrl: 'assets/images/dream_decoder.jpg',
        suit: 'Mind',
        emoji: '🌀',
      ),
      Omni(
        id: 'f3',
        title: 'Quantum You',
        subtitle: 'Explore parallel life paths',
        imageUrl: 'assets/images/quantum_you.jpg',
        suit: 'Mind',
        tag: 'New',
      ),
      Omni(
        id: 'f4',
        title: 'Inner Mirror',
        subtitle: 'See yourself with clarity',
        imageUrl: 'assets/images/inner_mirror.jpg',
        suit: 'Self',
        emoji: '🪞',
      ),
      Omni(
        id: 'f5',
        title: 'Emotional Weather',
        subtitle: 'Track and understand your patterns',
        imageUrl: 'assets/images/emotional_weather.jpg',
        suit: 'Heart',
      ),
    ];
  }

  // Simulated data for sample Series
  static List<Omni> getSampleSeries() {
    return [
      Omni(
        id: 's1',
        title: 'Start My Day Series',
        subtitle: '4 daily rituals to awaken clarity',
        imageUrl: 'assets/images/morning_ritual.jpg',
        suit: 'Life',
        tag: 'New',
        isSeries: true,
        seriesCount: 4,
      ),
      Omni(
        id: 's2',
        title: 'Anxiety Relief',
        subtitle: '5 techniques to find calm',
        imageUrl: 'assets/images/anxiety_relief.jpg',
        suit: 'Heart',
        isSeries: true,
        seriesCount: 5,
      ),
    ];
  }
} 