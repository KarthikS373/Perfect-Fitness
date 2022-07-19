import 'dart:async';

import 'package:camera/camera.dart';
import 'package:fitness_monitoring/Utils/Theme/colors.dart';
import 'package:fitness_monitoring/Widgets/Graph/cardioChart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

import '../../Models/Providers/healthProvider.dart';

// var data = [0.0, 1.0, 2.0, -1.5];

class HeartRateScreen extends StatefulWidget {
  const HeartRateScreen({Key? key}) : super(key: key);

  @override
  State<HeartRateScreen> createState() => _HeartRateScreenState();
}

class _HeartRateScreenState extends State<HeartRateScreen>
    with SingleTickerProviderStateMixin {
  setHeight() {
    return const SizedBox(
      height: 20,
    );
  }

  bool _toggled = false; // toggle button value
  final List<SensorValue> _data = <SensorValue>[]; // array to store the values
  late CameraController _controller;
  final double _alpha = 0.3; // factor for the mean value
  late AnimationController _animationController;
  double _iconScale = 1;
  int _bpm = 0; // beats per minute
  final int _fs = 30; // sampling frequency (fps)
  final int _windowLen = 30 * 6; // window length to display - 6 seconds
  late CameraImage _image; // store the last camera image
  late double _avg; // store the average value during calculation
  late DateTime _now; // store the now Datetime
  late Timer _timer; // timer for image processing

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animationController.addListener(() {
      setState(() {
        _iconScale = 1.0 + _animationController.value * 0.4;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _toggled = false;
    _disposeController();
    Wakelock.disable();
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor,
        body: Consumer<HealthProvider>(
            builder: (context, value, child) {
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(18),
                                ),
                                child: Stack(
                                  fit: StackFit.expand,
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    _toggled
                                        ? AspectRatio(
                                            aspectRatio:
                                                _controller.value.aspectRatio,
                                            child: CameraPreview(_controller),
                                          )
                                        : Container(
                                            padding: const EdgeInsets.all(12),
                                            alignment: Alignment.center,
                                            color: Colors.grey,
                                          ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(4),
                                      child: Text(
                                        _toggled
                                            ? "Cover both the camera and the flash with your finger"
                                            : "Camera feed will display here",
                                        style: TextStyle(
                                            backgroundColor: _toggled
                                                ? Colors.white
                                                : Colors.transparent),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "Estimated BPM",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                Text(
                                  (_bpm > 30 && _bpm < 150
                                      ? _bpm.toString()
                                      : "--"),
                                  style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),

                              ],
                            )),
                          ),
                        ],
                      )),
                      Expanded(
                        child: Center(
                          child: Transform.scale(
                            scale: _iconScale,
                            child: IconButton(
                              icon: Icon(_toggled
                                  ? Icons.favorite
                                  : Icons.favorite_border),
                              color: Colors.red,
                              iconSize: 100,
                              onPressed: () {
                                if (_toggled) {
                                  _untoggle();
                                } else {
                                  value.heartBeatListener(_bpm , value.d);
                                  _toggle();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          margin: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                              color: Colors.black),
                          child: Chart(_data),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const Text("Previous Heart Rates",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          )),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Sparkline(
                          data: value.d,
                          sharpCorners: true,
                          pointsMode: PointsMode.all,
                          pointColor: Colors.red,
                          pointSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }));
  }

  void _clearData() {
    // create array of 128 ~= 255/2
    _data.clear();
    int now = DateTime.now().millisecondsSinceEpoch;
    for (int i = 0; i < _windowLen; i++) {
      _data.insert(
          0,
          SensorValue(
              DateTime.fromMillisecondsSinceEpoch(now - i * 1000 ~/ _fs), 128));
    }
  }

  void _toggle() {
    _clearData();
    _initController().then((onValue) {
      Wakelock.enable();
      _animationController?.repeat(reverse: true);
      setState(
        () {
          _toggled = true;
        },
      );
      // after is toggled
      _initTimer();
      _updateBPM();
    });
  }

  void _untoggle() {
    _disposeController();
    Wakelock.disable();
    _animationController.stop();
    _animationController.value = 0.0;
    setState(() {
      _toggled = false;
    });
  }

  void _disposeController() {
    _controller.dispose();
    // _controller = null;
  }

  Future<void> _initController() async {
    try {
      List cameras = await availableCameras();
      _controller = CameraController(cameras.first, ResolutionPreset.low);
      await _controller.initialize();
      Future.delayed(const Duration(milliseconds: 100)).then((onValue) {
        _controller.setFlashMode(FlashMode.torch);
      });
      _controller.startImageStream((CameraImage image) {
        _image = image;
      });
    } catch (e) {
      // debugPrint(Exception);
    }
  }

  void _initTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 1000 ~/ _fs), (timer) {
      if (_toggled) {
        _scanImage(_image);
      } else {
        timer.cancel();
      }
    });
  }

  void _scanImage(CameraImage image) {
    _now = DateTime.now();
    _avg =
        image.planes.first.bytes.reduce((value, element) => value + element) /
            image.planes.first.bytes.length;
    if (_data.length >= _windowLen) {
      _data.removeAt(0);
    }
    setState(() {
      _data.add(SensorValue(_now, 255 - _avg));
    });
  }


  void _updateBPM() async {
    // Bear in mind that the method used to calculate the BPM is very rudimentar
    // feel free to improve it :)

    // Since this function doesn't need to be so "exact" regarding the time it executes,
    // I only used the a Future.delay to repeat it from time to time.
    // Ofc you can also use a Timer object to time the callback of this function
    List<SensorValue> _values;
    double _avg;
    int x = 0;
    int _n;
    double _m;
    double _threshold;
    double _bpm;
    int _counter;
    int _previous;
    while (_toggled) {
      _values = List.from(_data); // create a copy of the current data array
      _avg = 0;
      _n = _values.length;
      _m = 0;
      for (var value in _values) {
        _avg += value.value / _n;
        if (value.value > _m) _m = value.value;
      }
      _threshold = (_m + _avg) / 2;
      _bpm = 0;
      _counter = 0;
      _previous = 0;
      for (int i = 1; i < _n; i++) {
        if (_values[i - 1].value < _threshold &&
            _values[i].value > _threshold) {
          if (_previous != 0) {
            _counter++;
            _bpm += 60 *
                1000 /
                (_values[i].time.millisecondsSinceEpoch - _previous);
          }
          _previous = _values[i].time.millisecondsSinceEpoch;
        }
      }
      if (_counter > 0) {
        _bpm = _bpm / _counter;
        print(_bpm);
        x++;
        if (x == 7) {
          _untoggle();

        }
        setState(() {
          this._bpm = ((1 - _alpha) * this._bpm + _alpha * _bpm).toInt();
        });
      }
      await Future.delayed(Duration(
          milliseconds:
              1000 * _windowLen ~/ _fs)); // wait for a new set of _data values
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<CameraController>('_controller', _controller));
  }
}
