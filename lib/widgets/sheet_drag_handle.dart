import 'package:flutter/material.dart';

//GARIS KECIL ABU/ "SHEET UI" SEBAGAI TANDA BAHWA SCREEN/SHEET TERSEBUT BISA DI DRAG KE ATAS
class SheetDragHandle extends StatelessWidget {
  const SheetDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 44,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(3)
        ),
      ),
    );
  }
}