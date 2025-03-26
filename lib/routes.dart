// lib/routes.dart
import 'package:flutter/material.dart';
import 'package:futbolize/pages/availability_page.dart';
import 'package:futbolize/pages/chat_page.dart';
import 'package:futbolize/pages/home_page.dart';
import 'package:futbolize/pages/loading_screen.dart';
import 'package:futbolize/pages/login_page.dart';
import 'package:futbolize/pages/manage_devices_page.dart';
import 'package:futbolize/pages/matches_page.dart';
import 'package:futbolize/pages/notifications_page.dart';
import 'package:futbolize/pages/otp_verification_page.dart';
import 'package:futbolize/pages/profile_edit_page.dart';
import 'package:futbolize/pages/profile_page.dart';
import 'package:futbolize/pages/settings_page.dart';
import 'package:futbolize/pages/signup_page.dart';
import 'package:futbolize/pages/support_page.dart';
import 'package:futbolize/pages/team_details_page.dart';
import 'package:futbolize/pages/team_page.dart';
import 'package:futbolize/pages/tournament_details_page.dart';
import 'package:futbolize/pages/tournaments_page.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String signUpRoute = '/signup';
  static const String otpRoute = '/otp';
  static const String homeRoute = '/home';
  static const String profileRoute = '/profile';
  static const String supportRoute = '/support';
  static const String settingsRoute = '/settings';
  static const String notificationsRoute = '/notifications';
  static const String matchesRoute = '/matches';
  static const String tournamentsRoute = '/tournaments';
  static const String manageDevicesRoute = '/manage-devices';
  static const String profileEditRoute = '/profile-edit';
  static const String teamsRoute = '/teams';
  static const String tournamentDetailsRoute = '/tournament-details';
  static const String teamDetailsRoute = '/team-details';
  static const String chatRoute = '/chat';
  static const String availabilityRoute = '/availability';

  static Map<String, WidgetBuilder> get routes {
    return {
      initialRoute: (context) => LoadingScreen(),
      loginRoute: (context) => LoginPage(),
      signUpRoute: (context) => SignupPage(),
      otpRoute: (context) => OTPVerificationPage(),
      homeRoute: (context) => HomePage(),
      profileRoute: (context) => ProfilePage(),
      supportRoute: (context) => SupportPage(),
      settingsRoute: (context) => SettingsPage(),
      notificationsRoute: (context) => NotificationsPage(),
      matchesRoute: (context) => MatchesPage(),
      tournamentsRoute: (context) => TournamentsPage(),
      manageDevicesRoute: (context) => ManageDevicesPage(),
      profileEditRoute: (context) => ProfileEditPage(),
      teamsRoute: (context) => TeamsPage(),
      tournamentDetailsRoute: (context) => TournamentDetailsPage(),
      teamDetailsRoute: (context) => TeamDetailsPage(),
      chatRoute: (context) => ChatPage(),
      availabilityRoute: (context) => AvailabilityPage(),
    };
  }
}
