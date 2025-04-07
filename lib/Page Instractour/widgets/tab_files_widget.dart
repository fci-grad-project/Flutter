import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'file_card_widget.dart';
import 'package:file_picker/file_picker.dart';

class TabFilesWidget extends StatelessWidget {
  final List<PlatformFile> files;
  final String emptyMessage;
  final Function(PlatformFile) onFileTap;

  const TabFilesWidget({
    required this.files,
    required this.emptyMessage,
    required this.onFileTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (files.isEmpty) {
      return Center(child: Text(emptyMessage, style: GoogleFonts.cairo(fontSize: 18)));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: files.length,
      itemBuilder: (context, index) {
        final file = files[index];
        return FileCardWidget(file: file, onTap: () => onFileTap(file));
      },
    );
  }
}
