import 'package:flutter/material.dart';
import 'package:funciona_peru/home/pages/menu_pages/aprende_components/test_hero.dart';

class TestAprende extends StatefulWidget {
  const TestAprende({super.key, required this.category});
  final String category;

  @override
  State<TestAprende> createState() => _TestAprendeState();
}

class _TestAprendeState extends State<TestAprende> {
  late TransformationController controller;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TransformationController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aprende'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: buildImage(),
      ),
    );
  }

  Widget buildImage() {
    return Builder(
      builder: (context) => GestureDetector(
        onDoubleTap: () {
          final double scale = 3;
          final zoomed = Matrix4.identity()..scale(scale);

          final value = zoomed;
          controller.value = value;
        },
        child: InteractiveViewer(
          transformationController: controller,
          panEnabled: false,
          scaleEnabled: false,
          clipBehavior: Clip.none,
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      
                      builder: (context) => HeroTest(),
                    )),
                child: Hero(
        
                  tag: 'asd',
                  child: Image.asset(
                    'assets/girl1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
