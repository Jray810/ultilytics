import 'package:flutter/material.dart';
import 'package:ultilytics/views/auth/email_confirmation_view.dart';
import 'package:ultilytics/views/auth/login_view.dart';
import 'package:ultilytics/views/auth/register_view.dart';
import 'package:ultilytics/views/control_view.dart';
import 'package:ultilytics/views/games/add_game_view.dart';
import 'package:ultilytics/views/games/game_info_view.dart';
import 'package:ultilytics/views/player/add_player_view.dart';
import 'package:ultilytics/views/player/player_info_view.dart';
import 'package:ultilytics/views/profile/guest_profile_view.dart';
import 'package:ultilytics/views/profile/signed_in_profile_view.dart';
import 'package:ultilytics/views/team_list/add_existing_team_view.dart';
import 'package:ultilytics/views/team_list/add_team_view.dart';
import 'package:ultilytics/views/team_list/migrate_team_view.dart';
import 'package:ultilytics/views/team_list/team_list_view.dart';
import 'package:ultilytics/views/teams/remove_team_view.dart';
import 'package:ultilytics/views/teams/team_games_view.dart';
import 'package:ultilytics/views/teams/team_roster_view.dart';
import 'package:ultilytics/views/teams/team_view.dart';

import 'constants/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ultilytics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ControlView(),
      routes: {
        controlRoute: (context) => const ControlView(),
        teamListRoute: (context) => const TeamListView(),
        addTeamRoute: (context) => const AddTeamView(),
        addExistingTeamRoute: (context) => const AddExistingTeamView(),
        migrateTeamRoute: (context) => const MigrateTeamView(),
        signedInProfileRoute: (context) => const SignedInProfileView(),
        guestProfileRoute: (context) => const GuestProfileView(),
        loginRoute: (context) => const LoginView(),
        signupRoute: (context) => const RegisterView(),
        emailConfirmRoute: (context) => const EmailConfirmationView(),
        teamRoute: (context) => const TeamView(),
        removeTeamRoute: (context) => const RemoveTeamView(),
        teamRosterRoute: (context) => const TeamRosterView(),
        teamGamesRoute: (context) => const TeamGamesView(),
        playerInfoRoute: (context) => const PlayerInfoView(),
        addPlayerRoute: (context) => const AddPlayerView(),
        gameInfoRoute: (context) => const GameInfoView(),
        addGameRoute: (context) => const AddGameView(),
      },
    );
  }
}