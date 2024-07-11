import 'package:flutter/material.dart';

class Aprende2Game extends StatefulWidget {
  const Aprende2Game({super.key, required this.category});
  final String category;

  @override
  State<Aprende2Game> createState() => _Aprende2GameState();
}

class _Aprende2GameState extends State<Aprende2Game>
    with SingleTickerProviderStateMixin {
  //final double height = MediaQuery.of(context).size.height;
  //final double width = MediaQuery.of(context).size.width;
  OverlayEntry? entry;

  final double minScale = 1;
  final double maxScale = 4;
  double scale = 1;

  late TransformationController controller;

  late AnimationController animationController;
  Animation<Matrix4>? animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = TransformationController();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..addListener(() => controller.value = animation!.value)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              removeOverlay();
            }
          });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    animationController.dispose();
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
      builder: (context) => InteractiveViewer(
        transformationController: controller,
        panEnabled: false,
        clipBehavior: Clip.none,
        minScale: minScale,
        maxScale: maxScale,
        onInteractionStart: (details) {
          if (details.pointerCount < 2) return;

          showOverlay(context);
        },
        onInteractionUpdate: (details) {
          if (entry == null) return;

          this.scale = details.scale;
          entry!.markNeedsBuild();
        },
        onInteractionEnd: (details) {
          resetAnimation();
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/girl1.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  void showOverlay(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    entry = OverlayEntry(
      builder: (context) {
        /*final double opacity =
            ((scale - 1) / (maxScale - 1)).clamp(-400.2, 64.2);*/

        return Stack(
          children: <Widget>[
            Positioned.fill(child: Container(color: Colors.orange)),
            Positioned(
                left: offset.dx,
                top: offset.dy,
                width: size.width,
                child: buildImage()),
          ],
        );
      },
    );

    final overlay = Overlay.of(context);
    overlay.insert(entry!);
  }

  void removeOverlay() {
    entry?.remove();
    entry = null;
  }

  void resetAnimation() {
    animation = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    animationController.forward(from: 0);
  }
}

class AprendeITSE extends StatelessWidget {
  const AprendeITSE({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
