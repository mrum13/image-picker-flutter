import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker picker = ImagePicker();
    File? imageFile;

    chooseImages() async {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if(image!=null){
        setState(() {
          imageFile = File(image.path);
        });
      }
    }

    captureImages() async {
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      if(photo!=null){
        setState(() {
          imageFile = File(photo.path);
        });
      }
    }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageFile!=null?Image.file(imageFile!, width: 150, height: 200, fit: BoxFit.fill,):Icon(Icons.image, size: 150,),
              ElevatedButton(
                onPressed: (){chooseImages();},
                onLongPress: () {
                  captureImages();
                }, 
                child: const Text("Pilih / Tangkap Gambar"))
            ],
          ),
        )
      ),
    );
  }
}