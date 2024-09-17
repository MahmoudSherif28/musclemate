import 'package:image_picker/image_picker.dart';

void sendMediaMessage() async {
  ImagePicker picker = ImagePicker();
  XFile? file = await picker.pickImage(source: ImageSource.gallery);
}
