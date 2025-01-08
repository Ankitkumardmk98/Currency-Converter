# Currency Converter App

A **Flutter** app for converting USD to INR. This project demonstrates the basics of state management, user input handling, and a clean UI design.

## Features
- Converts USD to INR based on a predefined conversion rate.
- Simple, clean, and responsive UI.
- Handles invalid input gracefully.
- Modular code structure with constants for easy customization.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/currency-converter-app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd currency-converter-app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure
```
lib/
├── main.dart           # Entry point of the app
├── home.dart           # Home page with conversion logic
├── constants.dart      # Color constants for styling
```

## How It Works
1. Enter an amount in USD in the text field.
2. Click on the "Convert" button.
3. The converted amount in INR will appear below the button.

## Customization
- To change the conversion rate, modify the `rate` variable in `home.dart`.
- Update colors in `constants.dart` for a different theme.

## Built With
- [Flutter](https://flutter.dev/) - A cross-platform UI toolkit by Google.

## Author
**Ankit Kumar**  


## License
This project is open-source and available under the [MIT License](LICENSE).


- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
