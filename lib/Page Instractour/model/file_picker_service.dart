import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class FilePickerService {
  static Future<FilePickerResult?> pickFile() async {
    return await FilePicker.platform.pickFiles();
  }

  static Future<void> openFile(PlatformFile file) async {
    if (file.path != null) {
      await OpenFile.open(file.path!);
    }
  }
}
