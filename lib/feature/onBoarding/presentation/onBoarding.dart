import 'package:flutter/material.dart';
import 'package:fruit_ecommerce_app/feature/login/presentation/view/login_screen.dart';
import 'package:fruit_ecommerce_app/feature/onBoarding/presentation/widget/onBoarding_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  static const String routeName = 'onBoarding';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  static final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  void _navigateToLogin() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.routeName,
          (_) => false,
    );
  }

  void _handleNextPress() {
    if (_currentPage < onboardingPages(context).length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Durations.long1,
        curve: Curves.linear,
      );
    } else {
      _navigateToLogin();
    }
  }

  void _handleBackPress() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: Durations.long1,
        curve: Curves.linear,
      );
    }
  }

  List<Widget> onboardingPages(BuildContext context) {
    return [
      OnboardingCard(
        image: 'assets/bg1.png',
        imageOnBoarding: 'assets/fruit basket-amico 1.svg',
        title:
        'مرحبًا بك في Frutella',
        description:
        'اكتشف تجربة تسوق فريدة مع Frutella. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        buttonText: 'التالي',
      ),
      OnboardingCard(
        image: 'assets/bg2.png',
        imageOnBoarding: 'assets/pineapple-cuate 1.svg',
        title:
        'ابحث وتسوق',
        description:
        'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
        buttonText: 'ابدأ الان',
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Image.asset(
                (onboardingPages(context)[_currentPage] as OnboardingCard)
                    .image),
            Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery
                  .of(context)
                  .size
                  .height * 0.025),
              child: Column(
                //mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.02),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      children: onboardingPages(context),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.02),
                    SmoothPageIndicator(
                      controller: _pageController,
                      effect: const ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        dotColor: Color(0xffD9D9D9),
                        activeDotColor: Color(0xff1B5E37),
                      ),
                      count: onboardingPages(context).length,
                      onDotClicked: (index) {
                        _pageController.animateToPage(
                          index,
                          duration: Durations.long1,
                          curve: Curves.linear,
                        );
                      },
                    ),
                    SizedBox(height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery
                            .of(context)
                            .size
                            .width * 0.05,
                      ),
                      child:
                      _currentPage == 0
                          ? MaterialButton(
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        color: Color(0xff1B5E37),
                        minWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.05,
                        onPressed: _handleNextPress,
                        child: Text(
                          'التالي',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                          : Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            shape: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              borderSide: BorderSide(
                                color: Color(0xff1B5E37),
                              ),
                            ),
                            color: Colors.white,
                            minWidth: MediaQuery
                                .of(context)
                                .size
                                .width * 0.23,
                            height: 44,
                            onPressed: _handleBackPress,
                            child: Text(
                              'السابق',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: MediaQuery
                                    .of(
                                  context,
                                )
                                    .textScaler
                                    .scale(16),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          MaterialButton(
                            shape: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            color: Color(0xff1B5E37),
                            minWidth: MediaQuery
                                .of(context)
                                .size
                                .width * 0.23,
                            height: 44,
                            onPressed: _handleNextPress,
                            child: Text(
                              _currentPage ==
                                  onboardingPages(
                                    context,
                                  ).length -
                                      1
                                  ? 'ابدأ الان'
                                  : 'التالي',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery
                                    .of(
                                  context,
                                )
                                    .textScaler
                                    .scale(16),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
