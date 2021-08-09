import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_story/src/config/route_config.dart';

class StoryReaderController extends GetxController {
  ScrollController? scrollController;
  AnimationController? animationController;
  Animation<double>? fade;
  Rx<bool> showBottomUpButton = false.obs;

  bool played = false;
  final scrollUpDelay = 1000; // ms
  final fadeAnimDelay = 200; // ms

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController?.dispose();
  }

  bool handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      var metrics = notification.metrics;
      if (metrics.atEdge) {
        // at bottom
        if (metrics.pixels != 0) {
          if (!played) {
            animationController?.forward();
          }
        } else {
          played = false;
          animationController?.reverse();
        }
      } else {
        played = false;
        if (animationController!.isCompleted) {
          animationController?.reset();
        }
        animationController?.reverse();
      }
    }

    return true;
  }

  void initAnimation(TickerProvider provider) {
    debugPrint('Init animation...');
    animationController = AnimationController(
      vsync: provider,
      duration: Duration(milliseconds: fadeAnimDelay),
    );

    fade = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController!);

    animationController?.reverse();

    debugPrint('Init animation - done.');
  }

  void navigateToEditScreen() {
    Get.toNamed(RouteConfig.STORY_EDITOR);
  }

  void moveToTop() {
    if (scrollController == null || !scrollController!.hasClients) return;
    scrollController?.animateTo(0,
        duration: Duration(milliseconds: scrollUpDelay), curve: Curves.ease);
  }
}
