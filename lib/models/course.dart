import 'package:flutter/material.dart';

class Course {
  final String title, description, iconSrc;
  final Color bgColor;

  Course({
    required this.title,
    this.description = 'Build and animate a Flutter app from scratch',
    this.iconSrc = 'assets/icons/ios.svg',
    this.bgColor = const Color(0xFF3A98B9),
  });
}

List<Course> courses = [
  Course(
    title: 'Animations in SwiftUI',
  ),
  Course(
    title: 'Animations in Flutter',
    iconSrc: 'assets/icons/code.svg',
    bgColor: const Color(0xFFE8D5C4),
  ),
  Course(
    title: 'Animations in React',
    iconSrc: 'assets/icons/code.svg',
    bgColor: const Color(0xFF3A98B9),
  ),
];

List<Course> recentCourses = [
  Course(
    title: 'State Machine',
  ),
  Course(
    title: 'Animated Menu',
    iconSrc: 'assets/icons/code.svg',
    bgColor: const Color(0xFFE8D5C4),
  ),
  Course(
    title: 'Rive in Flutter',
  ),
  Course(
    title: 'Animations in Rive',
    iconSrc: 'assets/icons/code.svg',
    bgColor: const Color(0xFFE8D5C4),
  ),
];
