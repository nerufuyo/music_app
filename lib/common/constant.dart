// API
import 'package:flutter/material.dart';

const apiKey = '7acee3f86bf53400170d54206987763f';
const baseUrl = 'http://api.napster.com/v2.2/';

// Route
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

// State Enum
enum RequestState { empty, loading, loaded, error }
