import 'dart:async';
import 'package:eshop/admin/adminLogin.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Walkthrough-screens/Page1.dart';
import 'Walkthrough-screens/Page2.dart';
import 'Walkthrough-screens/Page3.dart';
import 'Walkthrough-screens/Page4.dart';
import 'admin/index_list.dart';
import 'admin/profileScreen.dart';

class HomePage extends StatelessWidget {
	final _controller = PageController();
	bool isLastPage = false;

@override
Widget build(BuildContext context) {
	return Scaffold(
		//backgroundColor: Colors.deepPurple[200],
		body: Column(
			mainAxisAlignment: MainAxisAlignment.spaceEvenly,
			children: [
				// page view
				SizedBox(
					height: 500,
					child: PageView(
						onPageChanged: (index) {
						setState(() => isLastPage = index == 4);
						//after spalsh screen login page loading
						Timer(Duration(seconds: 3), () {
							Navigator.of(context)
									.pushReplacement(MaterialPageRoute(builder: (_) => AdminSignInPage()));
							//later add adminsigninpage
						});
						},
						controller: _controller,
						children: const [
							Page1(),
							Page2(),
							Page3(),
							Page4(),
						],
					),
				),
				SizedBox(
					height: 5.0,
				),
				// dot indicators
				SmoothPageIndicator(
					controller: _controller,
					count: 4,
					effect: JumpingDotEffect(
						activeDotColor: Colors.deepPurple,
						dotColor: Colors.deepPurple.shade100,
						dotHeight: 20,
						dotWidth: 20,
						spacing: 16,
						//verticalOffset: 50,
						jumpScale: 3,
					),
				),
				SizedBox(
					height: 5.0,
				),
			],
		),
		bottomSheet: Container(
			padding: const EdgeInsets.symmetric(horizontal: 30),
			height: 40,
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: [
					TextButton(onPressed: () => _controller.jumpToPage(0) ,
							child: const Text('Skip')),
					TextButton(onPressed: () => _controller.nextPage(
							duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),
							child: const Text('Continue'),
					)
				],
			),
		),
	);
}

  void setState(bool Function() param0) {}
}