import 'package:flutter/material.dart';
import 'package:flutter_application/theme/app_theme.dart';

///
///Widget INi tidak menyimpan text yang di ketik penggunanya sendiri
///setiap kali pengguna mengetik,  OnChanged akan dipanggil dan HomeScreen yang akan menyimpan
///text nya lalu memakai untuk memfilter daftar produk. Ini contoh dari pola "lifting sate up"

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Cari Mawar,Tulip atau Anggrek',
        hintStyle: TextStyle(
          color: AppTheme.textSecondary,
          fontSize: 13.5
        ),
        prefixIcon: Icon(Icons.search_rounded, color: AppTheme.textSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none
        )
      ),
    );
  }
}