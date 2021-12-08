import 'dart:async';
import 'dart:convert';

import '../backend_uris.dart';

import '../flags.dart';
import 'package:http/http.dart' as http;

import '../routes.dart';

/// Our interface to the backend OR our mock data
class CMPLRService {
  static final Map<String, Set> users = {
    'emails': {
      'tarek@cmplr.org',
      'jimbo@cmprl.cum',
      'wael@bekes.net',
      'gendy@cmplr.eg',
    },
    'passwords': {
      '12345678',
      'hey12345',
      'sad43210',
      'Anime6420',
    },
    'names': {'burh', 'nerd', 'kak', 'AAA'}
  };

  /// Puts both emails and passwords into a map where the key is the email
  /// and the value is the password.
  // I just didn't want to repeat the same data in a different structure just
  // for 1 case
  static Map getEmailPassMap() {
    final emailPass = {};
    assert(users['emails']!.length == users['passwords']!.length);
    final mailIter = users['emails']!.iterator;
    final passIter = users['passwords']!.iterator;

    do {
      emailPass[mailIter.current] = passIter.current;
    } while (mailIter.moveNext() && passIter.moveNext());

    return emailPass;
  }

  /// Maps a route to the mock data it's supposed to receive
  static final Map<String, dynamic> _mockData = {
    // Extra signup whenever the user signups with their email
    // and they want to open their activity or profile screen.
    // each set is used to check whether a given email or username
    // is inside it or not.
    Routes.signupMailNameScreen: {
      // set of registered emails
      'emails': users['emails'],
      // set of used usernames
      'names': users['names']
    },
    Routes.loginEmailPassword: {
      'google_acount': {
        'email': 'cmplr.mock@gmail.com',
        'password': 'cmplr_mock_flutter'
      },
      'users': getEmailPassMap(),
    },
    Routes.signupPreferencesScreen: {
      'preference_names': [
        'Trendingaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaxx',
        'Art',
        'Writing',
        'Books & Libraries',
        'Streaming',
        'Positivity',
        'Aesthetic',
        'Television',
        'Funny',
        'Gaming',
        'Movies',
        'Music',
        'Comics',
        'Fashion'
      ]
    },
    Routes.signupPreferencesSearchScreen: {
      'popular_searched_topics': [
        'Barcelona',
        'PSG',
        'Real Madrid',
        'Atletico Madrid',
        'Manchester City',
        'Manchester United',
        'Chelsea',
        'Liverpool',
        'Arsenal',
        'Borussia Dortmund',
        'Inter Milan',
        'Ac Milan',
        'Juventus'
      ],
      'searched_topics': [
        'Atletico Madrid',
        'Manchester City',
        'Manchester United',
        'Chelsea',
        'Borussia Dortmund',
        'Inter Milan',
        'Ac Milan',
      ]
    },
  };

  static const requestSuccess = 200;
  static const invalidData = 422;
  static const unauthenticated = 401;

  static Future<http.Response> post(String route, Map params) async {
    // Switch case since we might need to send requests with different
    // content types

    switch (route) {
      case Routes.signupMailNameScreen:
        return signupMailNameVerification(route, params);
      case Routes.loginEmailPassword:
        return login(route, params);

      default:
        throw Exception('Invalid request route');
    }
  }

  // TODO: Rename this screen to "extra signup"
  static Future<http.Response> signupMailNameVerification(
      String route, Map params) async {
    if (Flags.mock) {
      final Set emails = _mockData[route]['emails'];
      final Set names = _mockData[route]['names'];

      final registeredEmail = emails.contains(params['Email']);
      final registeredName = names.contains(params['BlogName']);

      final bothFree = !registeredName && !registeredEmail;
      if (bothFree) {
        emails.add(params['Email']);
        names.add(params['BlogName']);
      }

      final responseCode = bothFree ? requestSuccess : invalidData;
      return http.Response('', responseCode);
    } else {
      return http.post(
        Uri(path: PostURIs.signup),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // TODO add authorization header
        },
        body: jsonEncode(params),
      );
    }
  }

  static Future<http.Response> login(String route, Map params) async {
    if (Flags.mock) {
      final email = params['Email'];
      final password = params['Password'];

      final emailsPasswords = _mockData[route]['users'];

      final matchingEmailPasswordCombination =
          emailsPasswords[email] == password;

      if (!matchingEmailPasswordCombination)
        return http.Response('', unauthenticated);

      return http.Response('', requestSuccess);
    } else {
      return http.post(
        Uri(path: PostURIs.login),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          // TODO add authorization header
        },
        body: jsonEncode(params),
      );
    }
  }

  // This functionality is not implemeted in the back-end
  static List initialPreferences(String route) {
    return _mockData[route]['preference_names'];
  }

  // This functionality is not implemeted in the back-end
  static List searchedTopics(String route, String topics) {
    return _mockData[route][topics];
  }
}
