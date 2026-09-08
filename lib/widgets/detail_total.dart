import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application/theme/app_theme.dart';

class DetailTotalBar extends StatelessWidget {
  const DetailTotalBar({super.key, required this.totalPrice});

  final Double totalPrice;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsetsGeometry.fromLTRB(22, 14, 22, 14),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 20,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Harga',
              style: TextStyle(fontSize: 13, color: AppTheme.textSecondary),
            ),
            Text(
              formatRupiah(totalPrice as double),
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: AppTheme.primaryDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
