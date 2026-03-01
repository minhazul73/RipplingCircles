import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class AnimatedMenuIconAnimationController extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController _controller;

  Rx<AnimationController> get controller => _controller.obs;
  RxBool isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }

  void triggerMenuClick() {
    isPlaying.value = !isPlaying.value;
    if(!isPlaying.value) {
      _controller.reverse();
    }
    else {
      _controller.forward();
    }
  }

  void resetToMenu() {
    isPlaying.value = false;
    _controller.reset();
  }

}