class Wheather {
  String name = '';
  String description = '';
  double temperature = 0;
  double preceived = 0;
  int pressure = 0;
  int humidity = 0;

  Wheather(this.name, this.description, this.temperature, this.preceived,
      this.pressure, this.humidity);

  Wheather.toJsonFormat(Map<String, dynamic> result) {
    this.name = result['name'];
    this.description = result['weather'][0]['description'];
    this.temperature = result['main']['temp'] ?? 0;
    this.preceived = result['main']['feel_like'] ?? 0;
    this.pressure = result['main']['pressure'] ?? 0;
    this.humidity = result['main']['humidity'] ?? 0;
  }
}
