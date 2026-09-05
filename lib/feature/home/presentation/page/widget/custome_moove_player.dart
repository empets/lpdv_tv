
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lpdv_tv/core/app_color/app_color.dart';
import 'package:lpdv_tv/feature/home/presentation/page/home_screen.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/adaptive.dart' as media_kit_video_controls;
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'dart:async';


// class CustomVideoPlayer extends StatefulWidget {
//   final String url;

//   const CustomVideoPlayer({
//     super.key,
//     required this.url,
//   });

//   @override
//   State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
// }

// class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
//   late final Player _player;
//   late final VideoController _controller;

//   StreamSubscription<bool>? _playingSubscription;
//   StreamSubscription<Duration>? _positionSubscription;
//   StreamSubscription<Duration>? _durationSubscription;

//   bool _isPlaying = false;
//   bool _showControls = true;

//   Duration _position = Duration.zero;
//   Duration _duration = Duration.zero;

//   Timer? _controlsTimer;

//   @override
//   void initState() {
//     super.initState();

//     _player = Player();
//     _controller = VideoController(_player);

//     _listenToPlayer();

//     _player.open(
//       Media(widget.url),
//     );
//   }

//   void _listenToPlayer() {
//     _playingSubscription = _player.stream.playing.listen((playing) {
//       if (!mounted) return;

//       setState(() {
//         _isPlaying = playing;
//       });
//     });

//     _positionSubscription = _player.stream.position.listen((position) {
//       if (!mounted) return;

//       setState(() {
//         _position = position;
//       });
//     });

//     _durationSubscription = _player.stream.duration.listen((duration) {
//       if (!mounted) return;

//       setState(() {
//         _duration = duration;
//       });
//     });
//   }

//   // ----------------------------------------------------------
//   // PLAY / PAUSE
//   // ----------------------------------------------------------

//   void _togglePlay() {
//     _player.playOrPause();

//     _showControlsTemporarily();
//   }

//   // ----------------------------------------------------------
//   // AVANCER 10 SECONDES
//   // ----------------------------------------------------------

//   void _forward10Seconds() {
//     final newPosition =
//         _position + const Duration(seconds: 10);

//     _player.seek(
//       newPosition > _duration ? _duration : newPosition,
//     );

//     _showControlsTemporarily();
//   }

//   // ----------------------------------------------------------
//   // RECULER 10 SECONDES
//   // ----------------------------------------------------------

//   void _rewind10Seconds() {
//     final newPosition =
//         _position - const Duration(seconds: 10);

//     _player.seek(
//       newPosition < Duration.zero
//           ? Duration.zero
//           : newPosition,
//     );

//     _showControlsTemporarily();
//   }

//   // ----------------------------------------------------------
//   // CONTROLES
//   // ----------------------------------------------------------

//   void _showControlsTemporarily() {
//     setState(() {
//       _showControls = true;
//     });

//     _controlsTimer?.cancel();

//     _controlsTimer = Timer(
//       const Duration(seconds: 3),
//       () {
//         if (!mounted || !_isPlaying) return;

//         setState(() {
//           _showControls = false;
//         });
//       },
//     );
//   }

//   void _toggleControls() {
//     if (!_showControls) {
//       _showControlsTemporarily();
//     } else {
//       setState(() {
//         _showControls = false;
//       });
//     }
//   }

//   // ----------------------------------------------------------
//   // FORMAT TEMPS
//   // ----------------------------------------------------------

//   String _formatDuration(Duration duration) {
//     final hours = duration.inHours;
//     final minutes =
//         duration.inMinutes.remainder(60).toString().padLeft(2, '0');

//     final seconds =
//         duration.inSeconds.remainder(60).toString().padLeft(2, '0');

//     if (hours > 0) {
//       return '$hours:$minutes:$seconds';
//     }

//     return '$minutes:$seconds';
//   }

//   // ----------------------------------------------------------
//   // VITESSE
//   // ----------------------------------------------------------

//   void _showSpeedDialog() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         final speeds = [
//           0.5,
//           0.75,
//           1.0,
//           1.25,
//           1.5,
//           1.75,
//           2.0,
//         ];

//         return SafeArea(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: speeds.map((speed) {
//               return ListTile(
//                 title: Text('${speed}x'),
//                 onTap: () {
//                   _player.setRate(speed);
//                   Navigator.pop(context);
//                 },
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }

//   // ----------------------------------------------------------
//   // VOLUME
//   // ----------------------------------------------------------

//   void _showVolumeDialog() {
//     double volume = 100;

//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setModalState) {
//             return SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(24),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Text(
//                       'Volume',
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     Slider(
//                       value: volume,
//                       min: 0,
//                       max: 100,
//                       onChanged: (value) {
//                         setModalState(() {
//                           volume = value;
//                         });

//                         _player.setVolume(value);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   // ----------------------------------------------------------
//   // FULLSCREEN
//   // ----------------------------------------------------------

//   void _openFullscreen() {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) {
//           return Scaffold(
//             backgroundColor: Colors.black,
//             body: SafeArea(
//               child: Center(
//                 child: CustomVideoPlayerFullscreen(
//                   controller: _controller,
//                   player: _player,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controlsTimer?.cancel();

//     _playingSubscription?.cancel();
//     _positionSubscription?.cancel();
//     _durationSubscription?.cancel();

//     _player.dispose();

//     super.dispose();
//   }

//   // ----------------------------------------------------------
//   // UI
//   // ----------------------------------------------------------

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: true,
//       bottom: true,
//       child: GestureDetector(
//         onTap: _toggleControls,
//         child: AspectRatio(
//           aspectRatio: 16 / 9,
//           child: Stack(
//             fit: StackFit.expand,
//             children: [
//               // --------------------------------------------------
//               // VIDEO
//               // --------------------------------------------------
      
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 20.h),
//                 child: Video(
//                   controller: _controller,
//                   fill: MyColors.primaryBlue,
//                 ),
//               ),
      
//               // --------------------------------------------------
//               // CONTROLES
//               // --------------------------------------------------
      
//               if (_showControls)
//                 _buildControls(),
               
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildControls() {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Colors.black.withValues(alpha: 0.55),
//             Colors.transparent,
//             Colors.black.withValues(alpha: 0.75),
//           ],
//         ),
//       ),
//       child: Column(
//         children: [
//           // ----------------------------------------------------
//           // TOP BAR
//           // ----------------------------------------------------

//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.end,
//           //   children: [
//           //     IconButton(
//           //       onPressed: _showSpeedDialog,
//           //       icon: const Icon(
//           //         Icons.speed,
//           //         color: Colors.white,
//           //       ),
//           //     ),

//           //     IconButton(
//           //       onPressed: _showVolumeDialog,
//           //       icon: const Icon(
//           //         Icons.volume_up,
//           //         color: Colors.white,
//           //       ),
//           //     ),
//           //   ],
//           // ),

//           const Spacer(),

//           // ----------------------------------------------------
//           // CENTER CONTROLS
//           // ----------------------------------------------------

//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // -10
//               _ControlButton(
//                 icon: Icons.replay_10,
//                 onPressed: _rewind10Seconds,
//               ),

//               const SizedBox(width: 20),

//               // PLAY / PAUSE
//               GestureDetector(
//                 onTap: _togglePlay,
//                 child: Container(
//                   width: 64,
//                   height: 64,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     _isPlaying
//                         ? Icons.pause
//                         : Icons.play_arrow,
//                     color: Colors.black,
//                     size: 34,
//                   ),
//                 ),
//               ),

//               const SizedBox(width: 20),

//               // +10
//               _ControlButton(
//                 icon: Icons.forward_10,
//                 onPressed: _forward10Seconds,
//               ),
//             ],
//           ),

//           const Spacer(),

//           // ----------------------------------------------------
//           // BOTTOM BAR
//           // ----------------------------------------------------

//           // Padding(
//           //   padding: const EdgeInsets.symmetric(
//           //     horizontal: 12,
//           //     vertical: 8,
//           //   ),
//           //   child: Column(
//           //     children: [
//           //       // PROGRESS
//           //       SliderTheme(
//           //         data: SliderTheme.of(context).copyWith(
//           //           trackHeight: 3,
//           //           thumbShape:
//           //               const RoundSliderThumbShape(
//           //             enabledThumbRadius: 5,
//           //           ),
//           //         ),
//           //         child: Slider(
//           //           value: _duration.inMilliseconds > 0
//           //               ? _position.inMilliseconds
//           //                   .clamp(
//           //                     0,
//           //                     _duration.inMilliseconds,
//           //                   )
//           //                   .toDouble()
//           //               : 0,
//           //           min: 0,
//           //           max: _duration.inMilliseconds > 0
//           //               ? _duration.inMilliseconds.toDouble()
//           //               : 1,
//           //           onChanged: (value) {
//           //             _player.seek(
//           //               Duration(
//           //                 milliseconds: value.toInt(),
//           //               ),
//           //             );
//           //           },
//           //         ),
//           //       ),

//           //       // TIME + FULLSCREEN
//           //       Row(
//           //         children: [
//           //           Text(
//           //             '${_formatDuration(_position)} / '
//           //             '${_formatDuration(_duration)}',
//           //             style: const TextStyle(
//           //               color: Colors.white,
//           //               fontSize: 12,
//           //             ),
//           //           ),

//           //           const Spacer(),

//           //           IconButton(
//           //             onPressed: _openFullscreen,
//           //             icon: const Icon(
//           //               Icons.fullscreen,
//           //               color: Colors.white,
//           //             ),
//           //           ),
//           //         ],
//           //       ),
//           //     ],
//           //   ),
//           // ),
       
//         ],
//       ),
//     );
//   }
// }

// // ============================================================
// // CONTROL BUTTON
// // ============================================================

// class _ControlButton extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback onPressed;

//   const _ControlButton({
//     required this.icon,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         width: 48,
//         height: 48,
//         decoration: BoxDecoration(
//           color: Colors.black.withValues(alpha: 0.55),
//           shape: BoxShape.circle,
//         ),
//         child: Icon(
//           icon,
//           color: Colors.white,
//           size: 28,
//         ),
//       ),
//     );
//   }
// }

// // ============================================================
// // FULLSCREEN
// // ============================================================

// class CustomVideoPlayerFullscreen extends StatefulWidget {
//   final Player player;
//   final VideoController controller;

//   const CustomVideoPlayerFullscreen({
//     super.key,
//     required this.player,
//     required this.controller,
//   });

//   @override
//   State<CustomVideoPlayerFullscreen> createState() =>
//       _CustomVideoPlayerFullscreenState();
// }

// class _CustomVideoPlayerFullscreenState
//     extends State<CustomVideoPlayerFullscreen> {
//   bool _playing = false;

//   StreamSubscription<bool>? _subscription;

//   @override
//   void initState() {
//     super.initState();

//     _playing = widget.player.state.playing;

//     _subscription = widget.player.stream.playing.listen(
//       (value) {
//         if (!mounted) return;

//         setState(() {
//           _playing = value;
//         });
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _subscription?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         Video(
//           controller: widget.controller,
//         ),

//         Center(
//           child: GestureDetector(
//             onTap: () {
//               widget.player.playOrPause();
//             },
//             child: Container(
//               width: 70,
//               height: 70,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 _playing
//                     ? Icons.pause
//                     : Icons.play_arrow,
//                 color: Colors.black,
//                 size: 38,
//               ),
//             ),
//           ),
//         ),

//         Positioned(
//           top: 16,
//           left: 16,
//           child: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(
//               Icons.close,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }






class CustomVideoPlayer extends StatefulWidget {
  final String url;
  final String? title;
  final bool autoPlay;
  final bool isLive;
  final bool enablePip;

  const CustomVideoPlayer({
    super.key,
    required this.url,
    this.title,
    this.autoPlay = false,
    this.isLive = false,
    this.enablePip = true,
  });

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late final Player _player;
  late final VideoController _controller;

  bool _isPlaying = false;
  bool _isBuffering = false;
  bool _showControls = true;
  bool _isPipMode = false;
  double _currentSpeed = 1.0;
  double _currentVolume = 100.0;

  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  Timer? _controlsTimer;
  StreamSubscription<bool>? _playingSubscription;
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration>? _durationSubscription;
  StreamSubscription<bool>? _bufferingSubscription;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      _player = Player();
      _controller = VideoController(_player);

      // Écouter les changements
      _playingSubscription = _player.stream.playing.listen((playing) {
        if (!mounted) return;
        setState(() => _isPlaying = playing);
      });

      _positionSubscription = _player.stream.position.listen((position) {
        if (!mounted) return;
        setState(() => _position = position);
      });

      _durationSubscription = _player.stream.duration.listen((duration) {
        if (!mounted) return;
        setState(() => _duration = duration);
      });

      _bufferingSubscription = _player.stream.buffering.listen((buffering) {
        if (!mounted) return;
        setState(() => _isBuffering = buffering);
      });

      // Charger la vidéo
      await _player.open(Media(widget.url));

      if (widget.autoPlay) {
        await Future.delayed(const Duration(milliseconds: 500));
        await _player.play();
      }

      debugPrint('✅ Vidéo chargée: ${widget.url}');
    } catch (e) {
      debugPrint('❌ Erreur: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur: $e')),
        );
      }
    }
  }

  void _togglePlay() {
    _player.playOrPause();
    _showControlsTemporarily();
  }

  void _forward10Seconds() {
    final newPosition = _position + const Duration(seconds: 10);
    _player.seek(newPosition > _duration ? _duration : newPosition);
    _showControlsTemporarily();
  }

  void _rewind10Seconds() {
    final newPosition = _position - const Duration(seconds: 10);
    _player.seek(newPosition < Duration.zero ? Duration.zero : newPosition);
    _showControlsTemporarily();
  }

  void _showControlsTemporarily() {
    setState(() => _showControls = true);
    _controlsTimer?.cancel();
    _controlsTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted || !_isPlaying) return;
      setState(() => _showControls = false);
    });
  }

  void _toggleControls() {
    setState(() => _showControls = !_showControls);
    if (_showControls && _isPlaying) {
      _showControlsTemporarily();
    }
  }

   void _togglePip() {
    setState(() => _isPipMode = !_isPipMode);
    if (!_isPipMode) {
      _showControlsTemporarily();
    }
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return hours > 0 ? '$hours:$minutes:$seconds' : '$minutes:$seconds';
  }

  void _showSpeedDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: MyColors.primaryWhite,
      builder: (context) {
        final speeds = [0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0];
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            
              ...speeds
                .map((speed) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                  decoration:  BoxDecoration(
                    border: _currentSpeed == speed ? Border.all(color: MyColors.primaryGray) : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Row(
                      children: [
                      
                        Text('${speed}x', style: GoogleFonts.inter(color: MyColors.primaryBlack, fontSize: 12.sp),),
                      ],
                    ),
                    trailing: _currentSpeed == speed
                        ? const Icon(Icons.check, color: MyColors.primaryOrange)
                        : null,
                    onTap: () {
                      _player.setRate(speed);
                      setState(() => _currentSpeed = speed);
                      Navigator.pop(context);
                    },
                  ),
                ))
                .toList(),]
          ),
        );
      },
    );
  }

  void _showVolumeDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: MyColors.primaryWhite,
      builder: (context) {
        return StatefulBuilder(
          
          builder: (context, setModalState) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Volume',
                      style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Slider(
                      value: _currentVolume,
                      min: 0,
                      max: 100,
                      activeColor: MyColors.primaryOrange,
                      inactiveColor: MyColors.primaryGray.withValues(alpha: 0.4),
                      onChanged: (value) {
                        setModalState(() => _currentVolume = value);
                        _player.setVolume(value);
                      },
                    ),
                    Text('${_currentVolume.toInt()}%', style: GoogleFonts.inter(color: MyColors.primaryBlack, fontSize: 12.sp,)),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _openFullscreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _FullscreenPlayer(
          player: _player,
          controller: _controller,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controlsTimer?.cancel();
    _playingSubscription?.cancel();
    _positionSubscription?.cancel();
    _durationSubscription?.cancel();
    _bufferingSubscription?.cancel();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

      // Mode PIP
    if (_isPipMode && widget.enablePip) {
      return PipWidget(
        player: _player,
        controller: _controller,
        onClosePip: _togglePip,
        title: widget.title,
      );
    }


    return GestureDetector(
      onTap: _toggleControls,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // VIDEO
            Container(
               margin: EdgeInsets.only(bottom: 5.h),
              child: Video(controller: _controller)),

            // BUFFERING
            if (_isBuffering)
              const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              ),

            // CONTROLES
            if (_showControls) _buildControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildControls() {
    final progressPercent = _duration.inMilliseconds > 0
        ? (_position.inMilliseconds / _duration.inMilliseconds).clamp(0.0, 1.0)
        : 0.0;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withValues(alpha: 0.55),
            Colors.transparent,
            Colors.black.withValues(alpha: 0.75),
          ],
        ),
      ),
      child: Column(
        children: [
          // TOP BAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_currentSpeed}x',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    if (!widget.isLive)
                    IconButton(
                      icon: const Icon(Icons.speed, color: Colors.white),
                      onPressed: _showSpeedDialog,
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up, color: Colors.white),
                      onPressed: _showVolumeDialog,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 0.01.sh),

          // CENTER CONTROLS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ControlButton(
                icon: Icons.replay_10,
                onPressed: _rewind10Seconds,
              ),
              const SizedBox(width: 24),

          


              GestureDetector(
                onTap: _togglePlay,
                child: Container(
                  height: 50.h,
                  width: 50.w,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: MyColors.primaryOrange,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.black,
                    size: 15.h,
                  ),
                ),
              ),
              const SizedBox(width: 24),
              _ControlButton(
                icon: Icons.forward_10,
                
                onPressed: _forward10Seconds,
              ),
            ],
          ),
          SizedBox(height: 5.h),

          const Spacer(),

          // BOTTOM BAR
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          //   child: Column(
          //     children: [
          //       SliderTheme(
          //         data: SliderTheme.of(context).copyWith(
          //           trackHeight: 4,
          //           thumbShape: const RoundSliderThumbShape(
          //             enabledThumbRadius: 6,
          //           ),
          //         ),
          //         child: Slider(
          //           value: progressPercent * 100,
          //           min: 0,
          //           max: 100,
          //           onChanged: (value) {
          //             final newPosition = Duration(
          //               milliseconds: ((_duration.inMilliseconds * value / 100).toInt())),
          //             );
          //             _player.seek(newPosition);
          //             _showControlsTemporarily();
          //           },
          //         ),
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             '${_formatDuration(_position)} / ${_formatDuration(_duration)}',
          //             style: const TextStyle(
          //               color: Colors.white,
          //               fontSize: 12,
          //             ),
          //           ),
          //           IconButton(
          //             icon: const Icon(Icons.fullscreen, color: Colors.white),
          //             onPressed: _openFullscreen,
          //             padding: EdgeInsets.zero,
          //             constraints: const BoxConstraints(),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double size;

  const _ControlButton({
    required this.icon,
    required this.onPressed,
    this.size = 48,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.55),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: size / 1.7,
        ),
      ),
    );
  }
}

class _FullscreenPlayer extends StatefulWidget {
  final Player player;
  final VideoController controller;

  const _FullscreenPlayer({
    required this.player,
    required this.controller,
  });

  @override
  State<_FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<_FullscreenPlayer> {
  bool _isPlaying = false;
  bool _showControls = true;
  Timer? _controlsTimer;

  StreamSubscription<bool>? _subscription;

  @override
  void initState() {
    super.initState();
    _isPlaying = widget.player.state.playing;
    _subscription = widget.player.stream.playing.listen((value) {
      if (!mounted) return;
      setState(() => _isPlaying = value);
    });
  }

  void _showControlsTemporarily() {
    setState(() => _showControls = true);
    _controlsTimer?.cancel();
    _controlsTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted || !_isPlaying) return;
      setState(() => _showControls = false);
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _controlsTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          setState(() => _showControls = !_showControls);
          if (_showControls && _isPlaying) _showControlsTemporarily();
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Video(controller: widget.controller),
            if (_showControls)
              Center(
                child: GestureDetector(
                  onTap: () {
                    widget.player.playOrPause();
                    _showControlsTemporarily();
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.black,
                      size: 44,
                    ),
                  ),
                ),
              ),
            if (_showControls)
              Positioned(
                top: 16,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
          ],
        ),
      ),
    );
  }
}



 
// ============================================================
// WIDGET PIP (Picture-in-Picture)
// ============================================================
 
class PipWidget extends StatefulWidget {
  final Player player;
  final VideoController controller;
  final VoidCallback onClosePip;
  final String? title;
 
  const PipWidget({
    required this.player,
    required this.controller,
    required this.onClosePip,
    this.title,
  });
 
  @override
  State<PipWidget> createState() => _PipWidgetState();
}
 
class _PipWidgetState extends State<PipWidget> {
  bool _showControls = true;
  Timer? _controlsTimer;
  Offset _offset = const Offset(8, 8);
  bool _isPlaying = false;
 
  StreamSubscription<bool>? _subscription;
 
  @override
  void initState() {
    super.initState();
    _isPlaying = widget.player.state.playing;
    _subscription = widget.player.stream.playing.listen((value) {
      if (!mounted) return;
      setState(() => _isPlaying = value);
    });
  }
 
  void _showControlsTemporarily() {
    setState(() => _showControls = true);
    _controlsTimer?.cancel();
    _controlsTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted || !_isPlaying) return;
      setState(() => _showControls = false);
    });
  }
 
  @override
  void dispose() {
    _subscription?.cancel();
    _controlsTimer?.cancel();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const pipWidth = 280.0;
    const pipHeight = 160.0;
 
    // Limiter la position
    final limitedOffset = Offset(
      _offset.dx.clamp(0, screenSize.width - pipWidth),
      _offset.dy.clamp(0, screenSize.height - pipHeight - 50),
    );
 
    return Positioned(
      left: limitedOffset.dx,
      top: limitedOffset.dy,
      width: pipWidth,
      height: pipHeight,
      child: GestureDetector(
        onTap: () {
          setState(() => _showControls = !_showControls);
          if (_showControls && _isPlaying) {
            _showControlsTemporarily();
          }
        },
        onPanUpdate: (details) {
          setState(() {
            _offset = Offset(
              _offset.dx + details.delta.dx,
              _offset.dy + details.delta.dy,
            );
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // VIDEO PIP
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Video(controller: widget.controller),
              ),
 
              // CLOSE BUTTON (toujours visible)
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: widget.onClosePip,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
 
              // CONTROLS
              if (_showControls)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.4),
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.6),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Title
                      if (widget.title != null)
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            widget.title!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
 
                      // Play/Pause button
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            widget.player.playOrPause();
                            _showControlsTemporarily();
                          },
                          child: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
 
                      // Empty space for balance
                      const SizedBox.shrink(),
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