import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lpdv_tv/core/app_color/app_color.dart';
import 'package:lpdv_tv/feature/auth/live/live_screen.dart';
import 'package:lpdv_tv/feature/home/presentation/page/home_screen.dart';
import 'package:lpdv_tv/gen/assets.gen.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  late int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryBlue,
      appBar: AppBar(
        backgroundColor: MyColors.primaryBlue,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: RefreshIndicator(
          onRefresh: () async {},
          color: MyColors.primaryOrange,
          child: IndexedStack(index: _currentIndex, children: [HomeScreen(), LiveSreen()]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MyColors.primaryBlue,
        selectedItemColor: MyColors.primaryOrange,
        unselectedItemColor: Colors.white,
        elevation: 0,
        selectedLabelStyle: GoogleFonts.inter(
          color: MyColors.primaryOrange,
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),
        items: [
          BottomNavigationBarItem(
            backgroundColor: MyColors.primaryBlue,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: MyColors.primaryBlue,
            icon: SvgPicture.asset(
              Assets.images.iconLiving.iconLiving,
              colorFilter: ColorFilter.mode(
                _currentIndex == 1 ? MyColors.primaryOrange : Colors.white,
                BlendMode.srcIn,
              ),
            ),
            label: 'En direct',
          ),
          BottomNavigationBarItem(
            backgroundColor: MyColors.primaryBlack,
            icon: SvgPicture.asset(
              Assets.images.iconHome.iconSearch,
              colorFilter: ColorFilter.mode(
                _currentIndex == 2 ? MyColors.primaryOrange : Colors.white,
                BlendMode.srcIn,
              ),
            ),
            label: 'Explorer',
          ),
          BottomNavigationBarItem(
            backgroundColor: MyColors.primaryBlue,
            icon: SvgPicture.asset(
              Assets.images.iconBible.iconBible,
              colorFilter: ColorFilter.mode(
                _currentIndex == 3 ? MyColors.primaryOrange : Colors.white,
                BlendMode.srcIn,
              ),
            ),
            label: 'Bible',
          ),
          BottomNavigationBarItem(
            backgroundColor: MyColors.primaryBlue,
            icon: Icon(Icons.more_vert_outlined),
            label: 'Plus',
          ),
        ],

        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ).animate(delay: 350.ms).fadeIn(duration: 600.ms).slideY(
                    begin: 0.2,
                    end: 0,
                  ),
    );
  }
}
