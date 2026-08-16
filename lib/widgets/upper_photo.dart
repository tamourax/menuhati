import 'dart:ui';
import 'package:flutter/material.dart';

/// Reusable hero card widget displaying a coffee shop banner with
/// responsive aspect ratio, gradient overlay, rating/distance badges,
/// and title/subtitle typography matching the design specifications.
class OakCoffeeHero extends StatelessWidget {
  final String shopName;
  final String subtitle;
  final String rating;
  final String reviewCount;
  final String distance;

  const OakCoffeeHero({
    super.key,

    this.shopName = 'Oak Coffee',
    this.subtitle = 'Artisanal Roasts & Organic Bakes',
    this.rating = '4.9',
    this.reviewCount = '1.2k',
    this.distance = '0.8 mi away',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 390 / 273,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(36),
            bottomRight: Radius.circular(36),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 1. Background Coffee Image
              Image(
                image: AssetImage('assets/png/coffe.jpg'),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFF2C221E),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.coffee,
                    size: 64,
                    color: Colors.white24,
                  ),
                ),
              ),

              // 2. Subtle Top-to-Bottom Gradient Overlay
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.40, 0.75, 1.0],
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.05),
                        Colors.black.withValues(alpha: 0.50),
                        Colors.black.withValues(alpha: 0.85),
                      ],
                    ),
                  ),
                ),
              ),

              // 3. Bottom Content (Badges + Title + Subtitle)
              Positioned(
                left: 20,
                right: 20,
                bottom: 24,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Rating & Distance Row
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildRatingBadge(
                          rating: rating,
                          reviewCount: reviewCount,
                        ),
                        const SizedBox(width: 8),
                        _buildDistanceBadge(distance: distance),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Main Title: Oak Coffee
                    Text(
                      shopName,
                      style: const TextStyle(
                        fontFamily: 'Playfair Display',
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        height: 48 / 40,
                        letterSpacing: -0.8,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Subtitle: Artisanal Roasts & Organic Bakes
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 24 / 16,
                        letterSpacing: 0.0,
                        color: const Color(0xFFFFFFFF).withValues(alpha: 0.80),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Glassmorphic rating badge: ★ 4.9 (1.2k)
  Widget _buildRatingBadge({
    required String rating,
    required String reviewCount,
  }) {
    return _buildGlassPill(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.star, size: 12, color: Color(0xFFFAB983)),
          const SizedBox(width: 4),
          Text(
            '$rating ($reviewCount)',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 12,
              height: 16 / 12,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }

  /// Glassmorphic distance badge: 0.8 mi away
  Widget _buildDistanceBadge({required String distance}) {
    return _buildGlassPill(
      child: Text(
        distance,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 12,
          height: 16 / 12,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }

  /// Helper widget for translucent glass-style pills
  Widget _buildGlassPill({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.20),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.35),
              width: 1.0,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// Alias for compatibility with project widget naming conventions
typedef UpperPhoto = OakCoffeeHero;
