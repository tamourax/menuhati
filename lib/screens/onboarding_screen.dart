import 'package:flutter/material.dart';
import 'package:menuhati/screens/home_screen.dart';

/// Data model representing each onboarding page item.
class OnboardingItem {
  final String topLabel;
  final String imageUrl;
  final String title;
  final String description;
  final String buttonText;
  final bool showSkip;

  const OnboardingItem({
    required this.topLabel,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.buttonText,
    this.showSkip = false,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Exact Figma color palette & typography specifications
  static const Color _bgScreen = Color(0xFFF7F5F2);
  static const Color _darkBrown = Color(0xFF33231D); // #33231D من فيجما
  static const Color _grayText = Color(0xFF7A736E);
  static const Color _topLabelGray = Color(0xFF8C8681);
  static const Color _indicatorInactive = Color(0xFFE2DED9);

  final List<OnboardingItem> _pages = const [
    OnboardingItem(
      topLabel: 'Onboarding',
      imageUrl:
          'https://images.unsplash.com/photo-1554118811-1e0d58224f24?q=80&w=1000&auto=format&fit=crop',
      title: 'Discover Cafés',
      description:
          'Find hidden gems and artisanal\ncoffee shops right in your\nneighborhood.',
      buttonText: 'Next',
      showSkip: false,
    ),
    OnboardingItem(
      topLabel: 'Onboarding: Explore the Menu',
      imageUrl:
          'https://images.unsplash.com/photo-1509785307050-d4066910ec1e?q=80&w=1000&auto=format&fit=crop',
      title: 'Explore the Menu',
      description:
          'Browse coffee, cold drinks,\ndesserts, and more.',
      buttonText: 'Next',
      showSkip: true,
    ),
    OnboardingItem(
      topLabel: 'Onboarding: Pick Your Favorite',
      imageUrl:
          'https://images.unsplash.com/photo-1534778191329-7d35368a1f89?q=80&w=1000&auto=format&fit=crop',
      title: 'Pick Your Favorite',
      description:
          'Find something you love and order\nit easily.',
      buttonText: 'Get Started',
      showSkip: false,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 380),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _navigateToHome();
    }
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MyHomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            // Top label area
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 14.0,
                bottom: 12.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _pages[_currentPage].topLabel,
                  style: const TextStyle(
                    color: _topLabelGray,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
            ),

            // PageView content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return _buildPageItem(_pages[index]);
                },
              ),
            ),

            // Page Indicators
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: _buildPageIndicator(),
            ),

            // Bottom Navigation Button
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 24.0,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 52.0,
                child: ElevatedButton(
                  onPressed: _onNextPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _darkBrown,
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shadowColor: _darkBrown.withValues(alpha: 0.35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.0),
                    ),
                  ),
                  child: Text(
                    _pages[_currentPage].buttonText,
                    style: const TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageItem(OnboardingItem item) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  // Image container: بدون بادنج نهائياً مع حواف دائرية 48px من الأسفل فقط
                  Expanded(
                    flex: 12,
                    child: SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.zero,
                          topRight: Radius.zero,
                          bottomLeft: Radius.circular(48.0),
                          bottomRight: Radius.circular(48.0),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              item.imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  color: const Color(0xFFEBE6E0),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                        _darkBrown,
                                      ),
                                      value: loadingProgress
                                                  .expectedTotalBytes !=
                                              null
                                          ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress
                                                  .expectedTotalBytes!
                                          : null,
                                    ),
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: const Color(0xFFEBE6E0),
                                  child: const Center(
                                    child: Icon(
                                      Icons.coffee_rounded,
                                      size: 54,
                                      color: _darkBrown,
                                    ),
                                  ),
                                );
                              },
                            ),
                            if (item.showSkip)
                              Positioned(
                                top: 16.0,
                                right: 18.0,
                                child: GestureDetector(
                                  onTap: _navigateToHome,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                      vertical: 4.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(alpha: 0.28),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: const Text(
                                      'Skip',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Text content section with exact Figma typography specs
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 18.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 6.0),
                        // Typography: Playfair Display, 700 bold, 32px, 40px line height (1.25), 0px letter spacing, #33231D
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: _darkBrown,
                            fontFamily: 'Playfair Display',
                            fontFamilyFallback: ['serif', 'Georgia'],
                            fontWeight: FontWeight.w700,
                            fontSize: 32.0,
                            height: 40.0 / 32.0,
                            letterSpacing: 0.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          item.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: _grayText,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            height: 1.45,
                            letterSpacing: 0.1,
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
      },
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_pages.length, (index) {
        final bool isActive = _currentPage == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 3.5),
          width: isActive ? 20.0 : 6.0,
          height: 6.0,
          decoration: BoxDecoration(
            color: isActive ? _darkBrown : _indicatorInactive,
            borderRadius: BorderRadius.circular(3.0),
          ),
        );
      }),
    );
  }
}
