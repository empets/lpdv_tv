import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lpdv_tv/core/app_color/app_color.dart';
import 'package:lpdv_tv/feature/home/presentation/page/home_screen.dart';
import 'package:lpdv_tv/feature/home/presentation/page/widget/custome_moove_player.dart';
import 'package:lpdv_tv/gen/assets.gen.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryBlue,
      appBar: AppBar(
        backgroundColor: MyColors.primaryBlue,
        leading:CustomeBackNavigator(),
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
               CustomVideoPlayer(
          url: 'https://www.w3schools.com/html/mov_bbb.mp4',
        ),
              
              // Stack(
              //   children: [
              //     Container(
              //       decoration: BoxDecoration(
              //         border: Border.all(color: Colors.transparent),
              //         borderRadius: BorderRadius.circular(12.r),
              //       ),
              //       child: ClipRRect(
              //         // borderRadius: BorderRadius.circular(12.r),
              //         child: Stack(
              //           children: [
              //             Image.asset(
              //               Assets.images.iconHome.image2.path,
              //               fit: BoxFit.cover,
              //               height: 0.3.sh,
              //               width: double.infinity,
              //             ),
              //             Container(
              //               height: 0.3.sh,
              //               width: double.infinity,
              //               decoration: BoxDecoration(
              //                 gradient: LinearGradient(
              //                   begin: Alignment.topCenter,
              //                   end: Alignment.bottomCenter,
              //                   colors: [
              //                     Colors.transparent,
              //                     Color(0xFF050814).withValues(alpha: 0.9),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     // Positioned(
              //     //   top: 10.r,
              //     //   left: 10.r,
              //     //   child: CustomeBackNavigator(),
              //     // ),
              //     Positioned(
              //       top: 0,
              //       bottom: 0,
              //       right: 0.45.sw,
              //       child: CutomePlayButton(),
              //     ),
              //   ],
              // ),
              // Divider(
              //   height: 0.7.h,
              //   color: MyColors.primaryGray.withValues(alpha: 0.4),
              // ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 16.h),
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16.h),
                      child: Row(
                        children: [
                          CustomeCardWithTextAndIcon(
                            text: 'Prédication',
                            style: GoogleFonts.inter(
                              color: MyColors.primaryOrange,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            borderColor: Border.all(
                              color: MyColors.primaryOrange,
                            ),
                            backgroundColor: Colors.transparent,
                            withIcon: false,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          SizedBox(width: 8.w),

                          CustomeCardWithTextAndIcon(
                            text: '43 min',
                            style: GoogleFonts.inter(
                              color: MyColors.primaryWhite,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            borderColor: Border.all(
                              color: MyColors.primaryGray,
                            ),
                            backgroundColor: MyColors.primaryGray.withValues(
                              alpha: 0.2,
                            ),
                            withIcon: true,
                            icon: Icons.access_time_rounded,
                            iconColor: MyColors.primaryWhite,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            borderRadius: BorderRadius.circular(16.r),
                            iconSize: 12.sp,
                          ),
                        ],
                      ),
                    ),

                    Text(
                      'La Puissance de la Prière',
                      style: GoogleFonts.inter(
                        color: MyColors.primaryWhite,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Pasteur Jean Luc · Hier',
                      style: GoogleFonts.inter(
                        color: MyColors.primaryGray,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 15.h),
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
                        SizedBox(width: 8.w),

                        CustomeContainerWitheIcon(
                              icon: Icons.favorite_border_rounded,
                              iconColor: MyColors.primaryOrange,
                            )
                            .animate(delay: 350.ms)
                            .fadeIn(duration: 600.ms)
                            .slideY(begin: 0.2, end: 0),
                        SizedBox(width: 8.w),

                        CustomeContainerWitheIcon(
                              icon: Icons.share_rounded,
                              iconColor: MyColors.primaryOrange,
                            )
                            .animate(delay: 350.ms)
                            .fadeIn(duration: 600.ms)
                            .slideY(begin: 0.2, end: 0),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Divider(
                      height: 0.7.h,
                      color: MyColors.primaryGray.withValues(alpha: 0.4),
                    ),
                    SizedBox(height: 16.h),

                      Text(
                        'À propos',
                        style: GoogleFonts.inter(
                          color: MyColors.primaryWhite,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    SizedBox(height: 16.h),
                    Text(
                      'Une rencontre puissante avec la Parole de Dieu. Laissez-vous toucher par ce message qui transforme les vies et apporte l\'espérance.',
                      style: GoogleFonts.inter(
                        color: MyColors.primaryGray,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                     SizedBox(height: 16.h),
                    Divider(
                      height: 0.7.h,
                      color: MyColors.primaryGray.withValues(alpha: 0.4),
                    ),
                    SizedBox(height: 16.h),
                      Text(
                      'Contenus similaires',
                      style: GoogleFonts.inter(
                        color: MyColors.primaryWhite,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                       Container(
                      height: 0.2.sh,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CutomeEventCard(
                          isPlayerSection: true,
                          isEventNowSection: false,
                          isEmitionSection: false,
                          isFutureEvent: false,
                          title: 'La Puissance de la Prière',
                          description: 'Pasteur Jean Luc · Hier',
                          eventNowDuration: '43 min',
                          eventNowType: 'Prédication',
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

class CustomeContainerWitheIcon extends StatelessWidget {
  const CustomeContainerWitheIcon({
    super.key,
    this.icon,
    this.color = MyColors.primaryOrange,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.transparent,
    this.borderColor = MyColors.primaryOrange,
    this.iconSize,
  });
  final IconData? icon;
  final double? iconSize;
  final Color color;
  final Color iconColor;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9.w),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: iconColor, size: iconSize ?? 20),
    );
  }
}

class CustomeBackNavigator extends StatelessWidget {
  const CustomeBackNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: MyColors.primaryBlue,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
