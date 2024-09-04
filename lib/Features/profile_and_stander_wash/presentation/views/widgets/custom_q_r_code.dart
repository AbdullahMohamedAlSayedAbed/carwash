import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CustomQRCode extends StatelessWidget {
  const CustomQRCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: 'QR code of car wash',
      version: QrVersions.auto,
      size: 150,
      gapless: false,
    );
  }
}
