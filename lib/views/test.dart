// import 'package:flutter/material.dart';
// import 'package:torch_light/torch_light.dart';
//
// class TouchLight extends StatelessWidget {
//   const TouchLight({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       SafeArea(
//       child: Scaffold(
//         body:
//
//         Center(
//           child: ElevatedButton(
//             onPressed: () {
//               _turnOnFlash(context);
//             },
//             child: const Text('Flash'),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<bool> _isTorchAvailable(BuildContext context) async {
//     try {
//       return await TorchLight.isTorchAvailable();
//     } on Exception catch (_) {
//       _showErrorMes(
//         'Could not check if the device has an available torch',
//         context,
//       );
//       rethrow;
//     }
//   }
//
//   Future<void> _turnOnFlash(BuildContext context) async {
//     try {
//       await TorchLight.enableTorch();
//     } on Exception catch (_) {
//       _showErrorMes('Could not enable Flashlight', context);
//     }
//   }
//
//   Future<void> _turnOffFlash(BuildContext context) async {
//     try {
//       await TorchLight.disableTorch();
//     } on Exception catch (_) {
//       _showErrorMes('Could not enable Flashlight', context);
//     }
//   }
//   void _showErrorMes(String mes, BuildContext context) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(mes)));
//   }
// }
