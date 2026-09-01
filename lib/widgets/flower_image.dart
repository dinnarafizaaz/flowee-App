import 'package:flutter/material.dart';
/**
 * Menampilkan gambar dari URL Internet
 * 1.Sedang dimuat: menampilkan indikator loading
 * 2.gagal memuat: menampilkan indikator ganti
 */
class FlowerNetworkImage extends StatelessWidget {
  const FlowerNetworkImage({
    super.key, 
    //Constructures
    required this.imageUrl, 
    required this.fallbackIcon, 
    required this.fallbackColor, 
    required this.fit
    });

    //Properties
    final String imageUrl;
    final IconData fallbackIcon;
    final Color fallbackColor;
    final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl, //panggil img
      fit: fit, //kita mau dia fit (atau pas di satu box)
      width: double.infinity,
      height: double.infinity,


      //LOADING INDIKATOR - yang akan di jalankan terus menerus oleh flutter, selama masih proses download dari internet
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        //PRIVATE PLACEHOLDER - Karena hanya akan muncul ketika "Gagal Memuat" /Kasus/Kondisi tertentu
        return _Placeholder(
          color: fallbackColor,
          child: SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator( //WIDGET YANG MUTER (LOADING YANG MENUNJUKKAN PROGRESS)
              strokeWidth: 2.2,
              color: fallbackColor,
              //Kalo Flutter ukuran total file maka akan menghitung proses download gambar
              //kalo Flutter tidak tahu total ukuran file maka akan mengembalikan null
              value: progress.expectedTotalBytes != null ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes! : null,
              //
            ),
          ),
        );
      },
       //errorBuilder, yang akan dipanggil kalua proses DI ATAS (Loaing gambar) GATOT
       errorBuilder: (context, error, stackTrace) {
        return _Placeholder(
          color: fallbackColor,
          child: Icon(fallbackIcon, size: 48, color: fallbackColor),
        );
       },
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.color, required this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.withValues(alpha: 0.18),
      alignment: Alignment.center,
      child: child,
    );
  }
}