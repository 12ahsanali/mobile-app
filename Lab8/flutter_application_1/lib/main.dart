import 'package:flutter/material.dart';
import 'weather_model.dart';
import 'weather_service.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService service = WeatherService();

  final TextEditingController cityController = TextEditingController();
  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();

  Future<Weather>? weatherFuture;

  void searchByCity() {
    if (cityController.text.isNotEmpty) {
      setState(() {
        weatherFuture = service.fetchWeatherByCity(cityController.text);
      });
    }
  }

  void searchByLatLon() {
    if (latController.text.isNotEmpty && lonController.text.isNotEmpty) {
      setState(() {
        weatherFuture = service.fetchWeatherByLatLon(
          double.parse(latController.text),
          double.parse(lonController.text),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather App")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔹 CITY SEARCH
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                hintText: "Enter City (Lahore)",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: searchByCity,
                ),
              ),
            ),

            SizedBox(height: 10),

            // 🔹 LAT/LON INPUT
            TextField(
              controller: latController,
              decoration: InputDecoration(
                hintText: "Latitude",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),

            TextField(
              controller: lonController,
              decoration: InputDecoration(
                hintText: "Longitude",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: searchByLatLon,
              child: Text("Search by Lat/Lon"),
            ),

            SizedBox(height: 20),

            // 🔹 RESULT
            Expanded(
              child: Center(
                child: weatherFuture == null
                    ? const Text("Enter data to search")
                    : FutureBuilder<Weather>(
                        future: weatherFuture,
                        builder: (context, snapshot) {

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } 
                          else if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}");
                          } 
                          else if (snapshot.hasData) {
                            final w = snapshot.data!;
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text(w.cityName,
                                    style: TextStyle(fontSize: 30)),

                                // 🔥 ICON (Challenge 3)
                                Image.network(
                                  "https://openweathermap.org/img/wn/${w.icon}@2x.png"
                                ),

                                Text("${w.temperature} °C",
                                    style: TextStyle(fontSize: 50)),

                                Text(w.description,
                                    style: TextStyle(fontSize: 20)),
                              ],
                            );
                          }

                          return const Text("No Data");
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}