import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lpdv_tv/core/app_color/app_color.dart';
import 'package:lpdv_tv/feature/home/presentation/page/home_screen.dart';
import 'package:lpdv_tv/feature/home/presentation/page/video_player_screen.dart';
import 'package:lpdv_tv/feature/home/presentation/page/widget/custome_moove_player.dart';
import 'package:lpdv_tv/gen/assets.gen.dart';

class LiveSreen extends StatefulWidget {
  const LiveSreen({super.key, required this.isActive});
  final bool isActive;

  @override
  State<LiveSreen> createState() => _LiveSreenState();
}

class _LiveSreenState extends State<LiveSreen> {

   bool _isPlaying = true;
  
    @override
  void didUpdateWidget(covariant LiveSreen oldWidget) {
    super.didUpdateWidget(oldWidget);

  
    
    if (widget.isActive && !oldWidget.isActive) {
     
       setState(() {
        _isPlaying = true;
       });
        print('✅ J\'entre dans LiveScreen $_isPlaying');
      // Init, fetch data, etc.
    } else if (!widget.isActive && oldWidget.isActive) {
     
       setState(() {
        _isPlaying = false;
       });
        print('❌ Je sors de LiveScreen $_isPlaying');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryBlue,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "En direct ",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        SvgPicture.asset(Assets.images.iconHome.iconSearch.path),
                        SizedBox(width: 16.w),
                        SvgPicture.asset(
                          Assets.images.iconHome.iconNotification.path,
                        ),
                        SizedBox(width: 7.w),
                        Container(
                              padding: EdgeInsets.all(5.w),
                              decoration: BoxDecoration(
                                color: MyColors.primaryOrange,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                Assets.images.iconHome.iconHeart.path,
                              ),
                            )
                            .animate(delay: 350.ms)
                            .fadeIn(duration: 600.ms)
                            .slideY(begin: 0.2, end: 0),
                      ],
                    ),
                  ],
                ),
              ),

              Stack(
                children: [
                  CustomVideoPlayer(
                    isLive: true,
                    url: 'https://www.w3schools.com/html/mov_bbb.mp4',
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.transparent),
                  //     borderRadius: BorderRadius.circular(12.r),
                  //   ),
                  //   child: ClipRRect(
                  //     // borderRadius: BorderRadius.circular(12.r),
                  //     child: Stack(
                  //       children: [
                  //       CustomVideoPlayer(
                  //   isLive: true,
                  //   url: 'https://www.w3schools.com/html/mov_bbb.mp4',
                  // ),
                  //         Container(
                  //           height: 0.3.sh,
                  //           width: double.infinity,
                  //           decoration: BoxDecoration(
                  //             gradient: LinearGradient(
                  //               begin: Alignment.topCenter,
                  //               end: Alignment.bottomCenter,
                  //               colors: [
                  //                 Colors.transparent,
                  //                 Color(0xFF050814).withValues(alpha: 0.9),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    top: 10.r,
                    left: 10.r,
                    width: 0.95.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomeCardWithTextAndIcon(
                              text: 'EN DIRECT',
                              style: GoogleFonts.inter(
                                color: MyColors.primaryWhite,
                                fontWeight: FontWeight.w700,
                                fontSize: 8.sp,
                              ),
                              backgroundColor: MyColors.primaryRed,
                              icon: Icons.circle,
                              iconColor: MyColors.primaryWhite,
                            ),
                            SizedBox(width: 10.r),
                            CustomeCardWithTextAndIcon(
                              text: '3 241',
                              textColor: MyColors.primaryWhite,
                              style: GoogleFonts.inter(
                                color: MyColors.primaryWhite,
                                fontWeight: FontWeight.w700,
                                fontSize: 8.sp,
                              ),
                              backgroundColor: MyColors.primaryBlue.withValues(
                                alpha: 0.2,
                              ),
                              icon: Icons.groups_outlined,
                              iconColor: MyColors.primaryWhite,
                            ),
                          ],
                        ),

                      
                      ],
                    ),
                  ),
              

             
                ],
              ),
              Container(
                padding: EdgeInsets.all(10.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Culte du Dimanche Matin',
                      style: GoogleFonts.inter(
                        color: MyColors.primaryWhite,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      'Pasteur Jean Luc Moukala · LPDV',
                      style: GoogleFonts.inter(
                        color: MyColors.primaryGray,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Rejoignez-nous pour ce culte dominical en direct depuis nos studios. Un temps de louange, de prière et de la Parole de Dieu.',
                      style: GoogleFonts.inter(
                        color: MyColors.primaryGray,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    Row(
                      children: [
                        CustomeCardWithTextAndIcon(
                          text: 'Lire',
                          style: GoogleFonts.inter(
                            color: MyColors.primaryBlack,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          borderColor: Border.all(
                            color: MyColors.primaryOrange,
                          ),
                          backgroundColor: MyColors.primaryOrange,
                          withIcon: true,
                          icon: Icons.play_arrow_rounded,
                          iconColor: MyColors.primaryBlack,
                          padding: EdgeInsets.symmetric(
                            horizontal: .2.sw,
                            vertical: 6.h,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        SizedBox(width: 20.w),

                        CustomeContainerWitheIcon(
                              icon: Icons.favorite_border_rounded,
                              iconColor: MyColors.primaryOrange,
                            )
                            .animate(delay: 350.ms)
                            .fadeIn(duration: 600.ms)
                            .slideY(begin: 0.2, end: 0),
                        SizedBox(width: 15.w),

                        CustomeContainerWitheIcon(
                              icon: Icons.share_rounded,
                              iconColor: MyColors.primaryOrange,
                            )
                            .animate(delay: 350.ms)
                            .fadeIn(duration: 600.ms)
                            .slideY(begin: 0.2, end: 0),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Culte du Dimanche Matin',
                      style: GoogleFonts.inter(
                        color: MyColors.primaryWhite,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Culte du Dimanche Matin',
                          style: GoogleFonts.inter(
                            color: MyColors.primaryWhite,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        CustomeCardWithTextAndIcon(
                          text: 'En cours',
                          style: GoogleFonts.inter(
                            color: MyColors.primaryWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                          ),
                          withIcon: false,
                          backgroundColor: MyColors.primaryRed,
                        ),
                      ],
                    ),

                    SizedBox(height: 10.h),

                    ...List.generate(
                      4,
                      (index) => Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 10.h),
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
                          border: Border(
                            top: index == 0
                                ? BorderSide(
                                    color: MyColors.primaryGray.withValues(
                                      alpha: 0.7,
                                    ),
                                  )
                                : BorderSide.none,
                            bottom: BorderSide(
                              color: MyColors.primaryGray.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          "13h30 Heure de Gloire",
                          style: GoogleFonts.inter(
                            color: MyColors.primaryGray,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
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
    );
  }
}
