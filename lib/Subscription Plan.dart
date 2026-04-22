// import 'package:flutter/material.dart';
// import 'package:never_have_iever_game/Ready%20to%20Play.dart';
//
// class Sub_Plans extends StatefulWidget {
//   const Sub_Plans({super.key});
//
//   @override
//   State<Sub_Plans> createState() => _Sub_PlansState();
// }
//
// class _Sub_PlansState extends State<Sub_Plans> with TickerProviderStateMixin {
//   String selectedPlan = "basic"; final int level = 1;
//   late AnimationController _fadeController;
//   late AnimationController _scaleController; bool isSuccess = false;
//   late Animation<double> _fadeAnimation;
//   late Animation<double> _scaleAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _fadeController = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );
//     _scaleController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
//     );
//     _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
//       CurvedAnimation(parent: _scaleController, curve: Curves.easeOutBack),
//     );
//
//     _fadeController.forward();
//   }
//
//   @override
//   void dispose() {
//     _fadeController.dispose();
//     _scaleController.dispose();
//     super.dispose();
//   }
//
//   Widget _planCard({
//     required String title,
//     required String price,
//     required String duration,
//     required bool isSelected,
//     required bool isPopular,
//     required VoidCallback onTap,
//     required int index,
//   }) {
//     return TweenAnimationBuilder<double>(
//       duration: Duration(milliseconds: 400 + (index * 100)),
//       tween: Tween(begin: 0.0, end: 1.0),
//       curve: Curves.easeOutCubic,
//       builder: (context, value, child) {
//         return Transform.translate(
//           offset: Offset(0, 30 * (1 - value)),
//           child: Opacity(
//             opacity: value,
//             child: child,
//           ),
//         );
//       },
//       child: GestureDetector(
//         onTapDown: (_) => _scaleController.reverse(),
//         onTapUp: (_) {
//           _scaleController.forward();
//           onTap();
//         },
//         onTapCancel: () => _scaleController.forward(),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             gradient: isSelected
//                 ? LinearGradient(
//               colors: [
//                 Colors.deepOrange.shade50,
//                 Colors.orange.shade50,
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             )
//                 : null,
//             color: isSelected ? null : Colors.white,
//             border: Border.all(
//               color: isSelected ? Colors.deepOrange : Colors.grey.shade300,
//               width: isSelected ? 2.5 : 1.5,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: isSelected
//                     ? Colors.deepOrange.withOpacity(0.3)
//                     : Colors.black.withOpacity(0.08),
//                 blurRadius: isSelected ? 20 : 10,
//                 offset: Offset(0, isSelected ? 8 : 4),
//                 spreadRadius: isSelected ? 2 : 0,
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       title,
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: isSelected ? Colors.deepOrange.shade900 : Colors.black87,
//                       ),
//                     ),
//                   ),
//                   if (isPopular)
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Colors.deepOrange, Colors.orange.shade600],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.deepOrange.withOpacity(0.4),
//                             blurRadius: 8,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: const [
//                           Icon(Icons.star, color: Colors.white, size: 14),
//                           SizedBox(width: 4),
//                           Text(
//                             "BEST VALUE",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 0.5,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(price, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.deepOrange, height: 1)),
//                   const SizedBox(width: 8),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 4),
//                     child: Text(
//                       duration,
//                       style: TextStyle(fontSize: 15, color: Colors.grey.shade600, fontWeight: FontWeight.w500)),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: isSelected
//                       ? Colors.white.withOpacity(0.7)
//                       : Colors.grey.shade50,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   children: [
//                     AnimatedContainer(
//                       duration: const Duration(milliseconds: 300),
//                       width: 24,
//                       height: 24,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         gradient: isSelected
//                             ? LinearGradient(
//                           colors: [Colors.deepOrange, Colors.orange.shade600],
//                         )
//                             : null,
//                         color: isSelected ? null : Colors.grey.shade300,
//                         boxShadow: isSelected
//                             ? [
//                           BoxShadow(
//                             color: Colors.deepOrange.withOpacity(0.4),
//                             blurRadius: 8,
//                             offset: const Offset(0, 2),
//                           ),
//                         ]
//                             : null,
//                       ),
//                       child: isSelected
//                           ? const Icon(Icons.check, color: Colors.white, size: 16)
//                           : null,
//                     ),
//                     const SizedBox(width: 12),
//                     const Icon(Icons.all_inclusive, color: Colors.deepOrange, size: 20),
//                     const SizedBox(width: 8),
//                     const Text(
//                       "Unlimited Questions",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.white,
//               Colors.orange.shade50.withOpacity(0.3),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: FadeTransition(
//             opacity: _fadeAnimation,
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 40),
//
//                     // Header with icon
//                     Container(
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             Colors.deepOrange.withOpacity(0.1),
//                             Colors.orange.withOpacity(0.1),
//                           ],
//                         ),
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.workspace_premium,
//                         size: 50,
//                         color: Colors.deepOrange,
//                       ),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     const Text("Choose Your Plan", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87)),
//
//                     const SizedBox(height: 8),
//
//                     Text("Unlock unlimited access to all features", style: TextStyle(fontSize: 16, color: Colors.grey.shade600, fontWeight: FontWeight.w500)),
//
//                     const SizedBox(height: 40),
//
//                     _planCard(
//                       title: "Questionary Basic",
//                       price: "\$7.99",
//                       duration: "per week",
//                       isSelected: selectedPlan == "basic",
//                       isPopular: false,
//                       index: 0,
//                       onTap: () {
//                         setState(() {
//                           selectedPlan = "basic";
//                         });
//                       },
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     _planCard(
//                       title: "Questionary Premium",
//                       price: "\$9.99",
//                       duration: "per week",
//                       isSelected: selectedPlan == "premium",
//                       isPopular: true,
//                       index: 1,
//                       onTap: () {
//                         setState(() {
//                           selectedPlan = "premium";
//                         });
//                       },
//                     ),
//
//                     const SizedBox(height: 40),
//
//                     // Enhanced Continue Button
//                     Container(
//                       width: double.infinity,
//                       height: 56,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         gradient: LinearGradient(
//                           colors: [
//                             Colors.deepOrange,
//                             Colors.orange.shade600,
//                           ],
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.deepOrange.withOpacity(0.4),
//                             blurRadius: 20,
//                             offset: const Offset(0, 10),
//                             spreadRadius: 2,
//                           ),
//                         ],
//                       ),
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.transparent,
//                           shadowColor: Colors.transparent,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                         ),
//                         onPressed: () {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Row(
//                                 children: const [
//                                   Icon(Icons.payment, color: Colors.white),
//                                   SizedBox(width: 12),
//                                   Text("This time not activate.", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
//                                 ],
//                               ),
//                               behavior: SnackBarBehavior.floating,
//                               backgroundColor: Colors.deepOrange,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               duration: const Duration(seconds: 3),
//                             ),
//                           );
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => Ready_To_Play()));
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: const [
//                             Text(
//                               "Continue",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                                 letterSpacing: 0.5,
//                               )),
//                             SizedBox(width: 8),
//                             Icon(Icons.arrow_forward, color: Colors.white, size: 20),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     // Terms and conditions
//                     Text("Cancel anytime. Terms apply.", style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
//
//                     const SizedBox(height: 30),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
