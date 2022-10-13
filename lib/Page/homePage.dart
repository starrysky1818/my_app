import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:my_app/Page/reward/sleep_planet_home.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/Page/timeSettingwithPicker.dart';
import 'package:flutter/physics.dart';

class DraggableCard extends StatefulWidget {
  const DraggableCard({required this.child, super.key});

  final Widget child;

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// The alignment of the card as it is dragged or being animated.
  ///
  /// While the card is being dragged, this value is set to the values computed
  /// in the GestureDetector onPanUpdate callback. If the animation is running,
  /// this value is set to the value of the [_animation].
  Alignment _dragAlignment = Alignment.center;

  late Animation<Alignment> _animation;

  /// Calculates and runs a [SpringSimulation].
  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );
    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details) {
        _controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          _dragAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2),
          );
        });
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        alignment: _dragAlignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/home.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column (
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Container(
              height: screenHeight*0.65,
              child: DraggableCard(
                child: GestureDetector(
                  onDoubleTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SleepPlanteHomePage()),
                    );
                  },
                  child: Container (
                    height:screenHeight*0.25,
                    width: screenWidth*0.60,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: const Color.fromRGBO(10,39,59,1),
                      image: DecorationImage(
                        image: AssetImage('images/plant.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: const Text('Enter your planet',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                            fontFamily: 'Inter-Bold'
                        )
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(screenWidth*0.25,10.0,screenWidth*0.25,10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: screenWidth*0.5,
                      child: ElevatedButton(
                        child: Text("Start Sleep",style: TextStyle(fontSize: 24)),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                            ),
                          ),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
                        ),
                        onPressed: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyTimeSetting()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )

            ),
            ]
        )
      )
    );
  }
}


