import 'dart:convert';
import 'dart:async';
import 'package:minio_new/io.dart';
import 'package:minio_new/minio.dart';

class S3Utility {
  final bucketName = "";
  final jsonDirectly = "";
  final voiceAudioDirectly = "";

  final minio = Minio(
    endPoint: 's3-ap-northeast-1.amazonaws.com',
    region: 'ap-northeast-1',
    accessKey: '【アクセスキー】',
    secretKey: '【シークレットアクセスキー】',
    useSSL: true,
  );

  Future<void> uploadAudioFile(audioPath) async {
    await minio.fPutObject(
      bucketName,
      voiceAudioDirectly,
      audioPath,
    );
  }

  Future<String> downloadJsonFile(String fileName) async {
    MinioByteStream data = await minio.getObject(jsonDirectly, fileName);
    String content = await data.transform(utf8.decoder).join();
    return content;
  }
}