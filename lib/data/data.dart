import 'package:dmms/Models/dashboard_cards.dart';
import 'package:dmms/Models/image_quiz.dart';
import 'package:dmms/Screens/MyPapers.dart';
import 'package:flutter/material.dart';



final List<DashCard> cards = [
  DashCard( imageUrl: 'assets/live-test.webp', name: 'Live Test',onClick: null),
  DashCard( imageUrl: 'assets/my-paper.webp', name: 'My Paper',onClick:MyPapers()),
  DashCard( imageUrl: 'assets/view-solution.webp', name: 'View Solution',onClick: null),
  DashCard( imageUrl: 'assets/join-test.webp', name: 'Join TestSeries',onClick: null),
  DashCard( imageUrl: 'assets/study-material.webp', name: 'Study Material',onClick: null),
  DashCard( imageUrl: 'assets/current-affairs.webp', name: 'Current Affairs',onClick: null),
  DashCard( imageUrl: 'assets/vacancy-info.webp', name: 'Vacancy Information',onClick: null),
  DashCard( imageUrl: 'assets/profile-info.webp', name: 'Profile Information',onClick: null),
  DashCard( imageUrl: 'assets/help-support.webp', name: 'Help & Support',onClick: null),
  DashCard( imageUrl: 'assets/change-password.webp', name: 'Change Password',onClick: null),
  DashCard( imageUrl: 'assets/logout.webp', name: 'Logout',onClick: null),
];

final List<DashCard> videoQuiz = [
  DashCard( imageUrl: 'assets/my-paper.webp', name: 'QUIZ FOR ESIC, PGI, DSSSB EXAM'),
  DashCard( imageUrl: 'assets/quiz.webp', name: 'DMMS SPECIAL'),
  DashCard( imageUrl: 'assets/view-solution.webp', name: 'TARGET AIIMS 2020'),

];


final List<ImageQuiz> imageQuiz = [
  ImageQuiz(title:'Quiz for all AIIMS Exam', description:'Based on Jodhpur AIIMS, Delhi AIIMS, Patna AIIMS all exams'),
  ImageQuiz(title:'Quiz for ESIC, PGI, DSSSB Exam', description:'Based on All Central Government Nursing Officer Exam. Join Membership Test Series for Full Paper'),
  ImageQuiz(title:'Quiz for Nursing Officer Exam', description:'Based on all State Government Nursing Officer Exam'),
];

List<AssetImage> imageList = [
  //AssetImage('assets/home-slider-1.png'),
  AssetImage('assets/home-slider-2.png'),
  AssetImage('assets/home-slider-2.png'),
  AssetImage('assets/home-slider-2.png'),
 // AssetImage('assets/home-slider-3.png'),
  // AssetImage('assets/change-password.png'),
];