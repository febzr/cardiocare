import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagedisplay extends StatefulWidget {
  
  final int width;
  final int height;

  const Imagedisplay({super.key,required this.width, required this.height});

  @override
  _LargeImageState createState() => _LargeImageState();
}

class _LargeImageState extends State<Imagedisplay> {
  @override
  final ImagePicker _picker = ImagePicker();

  Future<File?> _pickImage() async {
    File? image;
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
    return image;
  }

  Future<String?> _uploadImage(img) async {
    if (img != null) {
      try {
        final storageRef = FirebaseStorage.instance.ref();
        final imageRef = storageRef.child(
            'uploads/${DateTime.now().millisecondsSinceEpoch}_${FirebaseAuth.instance.currentUser!.displayName}.jpg');
        await imageRef.putFile(img!);
        final imageUrl = await imageRef.getDownloadURL();
        print('Image uploaded! URL: $imageUrl');
        return imageUrl;
      } catch (e) {
        print('Error uploading image: $e');
        return null;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     
      child: Material(
          borderRadius: const BorderRadius.all(Radius.circular(1000)),
          child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(1000)),
              splashColor: Colors.transparent,
              onTap: () async {
                User? user = FirebaseAuth.instance.currentUser;
                File? a = await _pickImage();
                if(a!=null){
                String? b = await _uploadImage(a);
                String? oldPhotoURL = user!.photoURL;
                if(oldPhotoURL!=null){
                  String oldPhotoUri = path.basename(oldPhotoURL);
                   final storageRef = FirebaseStorage.instance.refFromURL(oldPhotoURL);
                     await storageRef.delete();}
                await user.updatePhotoURL(b);
                await user.reload();
                setState(() {
                  
                });}
                a=null;
              },
              child: Container( decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4), // Cor da sombra, 
            blurRadius: 4, // Raio de desfoque da sombra
            offset: const Offset(0, 4), // Deslocamento da sombra
          ),
        ],
        shape: BoxShape.circle, // Define a forma como círculo
      ),
                
                width: (widget.width/932)*MediaQuery.of(context).size.height,
                  height: (widget.height/932)*MediaQuery.of(context).size.height,
                  child: ClipOval(
                child: Image.network(FirebaseAuth.instance.currentUser!.photoURL!=null?FirebaseAuth.instance.currentUser!.photoURL!:'https://via.placeholder.com/150',
                  width: (widget.width/932)*MediaQuery.of(context).size.height,
                  height: (widget.height/932)*MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
              ))))
    );
  }
}
