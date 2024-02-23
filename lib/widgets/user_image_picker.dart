import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({Key? key}) : super(key: key);

  @override
  State<UserImagePicker> createState() {
    // TODO: implement createState
    return _UserImagePickerState();
  }
}

class _UserImagePickerState extends State<UserImagePicker> {
  void _pickImage() async {
   final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 50, maxHeight: 150);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
        foregroundColor: ...,),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.image),
          label: Text(
            'Add image',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
