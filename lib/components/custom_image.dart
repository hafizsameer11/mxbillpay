

import 'dart:io';
import 'dart:typed_data';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



Widget imageAsset(String image,
        {color, double? scale, double? width, double? height, BoxFit? fit}) =>
    Image.asset(
      image,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );

Widget imageFile(File file,
        {double? scale, double? width, double? height, BoxFit? fit}) =>
    Image.file(
      file,
      height: height,
      width: width,
      fit: fit,
    );

Widget imageMemory(Uint8List bytes,
        {double? scale, double? width, double? height, BoxFit? fit}) =>
    Image.memory(
      bytes,
      height: height,
      width: width,
      fit: fit,
    );


imageAssetProvider(name) => AssetImage(name);

imageNetworkProvider(name) => NetworkImage(name);

imageFileProvider(name) => FileImage(name);


