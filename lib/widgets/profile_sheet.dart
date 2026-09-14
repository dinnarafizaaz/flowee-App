import 'package:flutter/material.dart';
import 'package:flutter_application/data/dummy_data.dart';
import 'package:flutter_application/state/auth_controller.dart';
import 'package:flutter_application/theme/app_theme.dart';
import 'package:flutter_application/widgets/sheet_drag_handle.dart';

void showProfileSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) => _ProfileSheetContent(homeContext: context),
  );
}

class _ProfileSheetContent extends StatelessWidget {
  const _ProfileSheetContent({required this.homeContext});

  final BuildContext homeContext;

  Future<void> _logout(BuildContext sheetContext) async {
    Navigator.of(sheetContext).pop();
    await AuthController.instance.logout();

    if (!homeContext.mounted) { //Mounted = Ketersediaan screen yang ready | !  = Not (homecontext,...)
      Navigator.of(homeContext).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => Placeholder(),
        ), //ARAHKAN NAVIGASI KE LOGIN SCREEN

        ///
        ///Predicate ini bilang: "hapus SEMUA halaman sebelumnya dari riwayat navigasi"
        ///Jadi, Setelah logout, tombol back tidak akan mengembalikan pengguna ke halaman home
        ///
      
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(4, 12, 24, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SheetDragHandle(),

          SizedBox(height: 24),

          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primary, AppTheme.primaryDark],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.person_rounded, color: Colors.white, size: 34),
          ),

          SizedBox(height: 14),
          Text(
            DummyUser.name,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),

          SizedBox(height: 4),
          Text(
            DummyUser.email,
            style: TextStyle(fontSize: 13, color: AppTheme.textSecondary),
          ),

          SizedBox(height: 26),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _logout(context),
              icon: Icon(Icons.logout_rounded, size: 18),
              label: Text('keluar'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.primaryDark,
                side: BorderSide(color: AppTheme.primary),
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
              ),
            ),
          ),
        ],
      ),
    );
  }
}
