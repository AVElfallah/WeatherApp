enum Temperature {
  c,
  f,
}

enum WindSpeed {
  mph,
  kph,
}

enum PressureIn {
  mb,
  inc,
}

PressureIn? getPressureInByKey(String key) {
  switch (key) {
    case 'inc':
      return PressureIn.inc;
    case 'mb':
      return PressureIn.mb;
    default:
      return PressureIn.mb;
  }
}

WindSpeed? getWindSpeedByKey(String key) {
  switch (key) {
    case 'mph':
      return WindSpeed.mph;
    case 'kph':
      return WindSpeed.kph;
    default:
      return WindSpeed.kph;
  }
}

Temperature? temperatuerByKey(String key) {
  switch (key) {
    case 'c':
      return Temperature.c;
    case 'f':
      return Temperature.f;
    default:
      return Temperature.c;
  }
}
