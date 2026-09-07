import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/promo_banner.dart';
import 'package:flutter_application/widgets/banner_slide.dart';
import 'package:flutter_application/widgets/carousel_dots.dart';

// carousel banner akan bergeser otomatis setiap beberapa detik, untk handling timer seperti ini kita butuh peran stf untuk melakukan perubahan widget pada layar
class BannerCarousel extends StatefulWidget {
  /**
   * PageController -> untuk mengatur slide mana yg sedang tampil di PageView
   */
  const BannerCarousel({super.key, required this.banners});
  final List<PromoBanner> banners;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  late final PageController _controller = PageController();
  Timer? _timer;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!mounted || widget.banners.isEmpty) return;
      
      // Menggunakan sisa bagi (%) agar setelah halaman terakhir kembali ke halaman pertama
      final next = (_page + 1) % widget.banners.length;
      
      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  /**
  * Timer HARUS dicancel saat widget dihancurkan (saat tidak tampil di layar), kalau lupa
  * timer akan terus mencoba jalan di latar belakang (background), walau carousel nya sudah 
  * tidak muncul di layar, ini salah satu penyebab umum memory leak di Flutter.
  */
  
  @override
  
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox.shrink();
    
    return Column(
      children: [

        //Slider
        SizedBox(
          height: 168,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.banners.length,
            /**
             * dipanggil juga saat pengguna SWIPE manual, bukan cuman saat
             * digeser otomatis oleh Timer, supaya tiitk indikator di bawah selalu sinkron dengan 
             */
            onPageChanged: (index) => setState(() => _page = index),
            itemBuilder: (context, index) => BannerSlide(banner: widget.banners[index]),
          ),
        ),
        
        //jarak ama bulet2 nya
        SizedBox(height: 10),

        //bulet2 nya
        CarouselDots(
          count: widget.banners.length, 
          activeIndex: _page, 
          activeColor: widget.banners[_page].gradientColors.first
          )
      ],
    );
  }
}
