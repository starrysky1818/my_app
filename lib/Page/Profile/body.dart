import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic()
      ],
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('images/Default_Profile_Photo.jpg'),
          ),
          Positioned(
            right: -15,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: ClipOval(
                child: Material(
                  color: Colors.white30,
                  child: InkWell(
                    splashColor: Colors.black,
                    onTap: () {},
                    child: Icon(Icons.camera_alt_rounded),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}