# ThanceDemo

 Authentication and State Management Flow using Flutter, Firebase, and BLoC

## Getting Started

## Features

- **Splash Screen**: A splash screen that transitions to the sign-up screen.
- **Sign-Up Screen**: User registration with email and password.
- **Name Entry Screen**: User enters their name after successful registration.
- **Home Screen**: Display welcome message with user's name and logout functionality.

## Architecture and Implementation

### Folder Structure

- `lib/`
  - `config/`: Api base url and configration
  - `models/`: models for Rest api and local model
  - `helper/`:  folder. This folder can contain utility classes and functions that assist in various tasks across your application
  - `helper/`:  folder. This folder can contain utility classes and functions that assist in various tasks across your application
  - `network/`: Rest Api network for GET POST PUT DELETE methods.
  - `screen/`: UI screens of the application.
  - `repo/`: Firebase services for authentication and database operations.
  - `src/`: String generate.
  - `utils/`:utilities.
  - `widgets/`:common widgets for app.
 

 ### Splash Screen

- The splash screen checks the user's authentication status using Firebase.
- If the user is authenticated, it navigates to the home screen.
- If the user is not authenticated, it navigates to the sign-up screen.

### Sign-Up Screen

- Allows users to register using their email and password.
- Validates email and password inputs using BLoC-based validation.
- Navigates to the name entry screen upon successful registration.

### Name Entry Screen

- After successful registration, users can enter their name.
- Validates that the user's name is entered before allowing access to the home screen.
- Navigates to the home screen upon successful entry of the user's name.

### Home Screen

- Displays a welcome message with the user's name.
- Allows users to log out and returns them to the sign-up screen.
- Manages user session and maintains login state.

### State Management

- Uses BLoC (Business Logic Component) pattern for state management.
- BLoC handles user registration, login, and validation.
- Utilizes MultiBlocListener to respond to different states and trigger navigation and toast messages.

### Firebase Integration

- Utilizes Firebase Authentication for user registration and login.
- Uses Firestore for storing user data.
## Getting Started

1. Clone the repository.
2. Set up your Firebase project and add the necessary configurations.
3. Run `flutter pub get` to install dependencies.
4. Run the app using `flutter run`.
5. for string generate  ` flutter pub run intl_utils:generate`.
6. for asset generate and frezed class generate ` flutter pub run build_runner watch --delete-conflicting-outputs`.


## dependencies

# cupertino_icons: ^1.0.2
-This package provides the Cupertino icons, which are the default icons used in iOS apps, for use in your Flutter app's UI.

# flutter_lints: ^2.0.0
-This package provides lint rules and configurations that help you ensure code quality, consistency, and best practices within your Flutter codebase. It works in conjunction with tools like Dart's analyzer and linter to provide helpful suggestions and warnings during development.

# flutter_screenutil: ^5.7.0
-This package allows you to create adaptive UI layouts that automatically adjust to different screen sizes and resolutions. It provides a simple way to define dimensions, fonts, and other styles based on the device's screen dimensions. This is especially useful for creating consistent and visually appealing user interfaces across various devices.

# google_fonts: ^5.1.0
-This package provides a convenient way to select and apply Google Fonts to your app's text elements. It allows you to easily use a variety of fonts without the need to manually download and include font files in your project. The package provides a wide range of customization options for different font styles and weights, making it a versatile choice for enhancing your app's typography.

# build_runner: ^2.3.3
 -is a Flutter package used for generating code that helps with tasks like code generation, reflection, and more.

# flutter_gen_runner: ^5.1.0+1
 -is a Flutter package used for generating code to easily access assets, fonts, and more in a type-safe manner.

# flutter_svg: ^1.1.6
 -is a Flutter package that allows you to easily render SVG (Scalable Vector Graphics) images in your Flutter applications.

# flutter_bloc: ^8.1.3
 -is a state management library for Flutter applications that helps implement the BLoC (Business Logic Component) architecture pattern, making it easier to manage and control the state of your app's components.

# firebase_core: ^2.15.0
-is a Flutter plugin that provides a way to initialize Firebase services in your Flutter app. It's a prerequisite for using other Firebase plugins like authentication (firebase_auth) and Firestore (cloud_firestore). It allows you to set up and configure Firebase services in your app and provides a central point for initializing Firebase-related functionality.

# firebase_auth: ^4.7.2
- is a Flutter plugin that provides authentication services using Firebase. It allows you to integrate various authentication methods into your Flutter app, such as email/password authentication, phone number authentication, Google Sign-In, Apple Sign-In, etc. This plugin enables you to manage user authentication, registration, and login, as well as handle authentication-related tasks like password reset and token management.

# cloud_firestore: ^4.8.4
- is a Flutter plugin that provides a convenient way to interact with Cloud Firestore, a NoSQL database offered by Firebase. It allows you to perform CRUD (Create, Read, Update, Delete) operations on structured data in real-time. This plugin enables you to store, retrieve, and sync data across devices and platforms using Firestore's real-time synchronization capabilities. It's a powerful tool for building scalable and responsive applications that require real-time data synchronization and offline support.

# bloc: ^8.1.2
- library is a valuable tool for implementing robust state management in Flutter apps, helping you organize your code and build maintainable, scalable, and testable applications.

# equatable: ^2.0.3
-is often used in combination with state management libraries like bloc to ensure accurate comparison of states and events, making the state transitions more predictable and efficient.

#  dartz: ^0.10.1
-is a Dart library that introduces functional programming constructs like Option and Either types, enabling safer and more expressive error handling and data manipulation in Dart applications. It encourages a more functional style of coding.

# freezed: ^2.0.3+1
-is a Dart package that simplifies data class and union class creation by automatically generating necessary code, including equality methods, copy methods, and more. It's particularly useful for defining immutable data structures with minimal boilerplate code.

# freezed_annotation: ^2.4.1
-is a Dart package used in conjunction with the freezed package to generate code for data classes and union classes with minimal boilerplate. It helps reduce the manual work required to create immutable classes and manage equality, copy, and serialization methods.

# flutter_gen:
-configuration provided sets up code generation for assets, integration with the flutter_svg package, and specifies the output directory for the generated code. It also enables null safety and defines asset-related settings. This configuration is typically added to the pubspec.yaml file of a Flutter project to automate the process of managing assets and generating code for them.
command: ' flutter pub run build_runner watch --delete-conflicting-outputs'
use: Assets.images.png.flutterBlocLogo.image(), Assets.images.png.flutterBlocLogo.provider()

# flutter_intl
-configuration provided enables internationalization (i18n) support in the Flutter project. It specifies the main locale, output directory for the generated code, class name, and the directory containing the .arb files for localization strings. This setup allows for easy management of localized strings and automatic code generation for translations in the specified output directory and class name.
command: flutter pub run intl_utils:generate
use: Lang.current.password
step: src/i10n/intl_en.arb/ add your string  json format and add command

assets:
    - assets/images/jpg/
    - assets/images/png/
    - assets/images/svg/

-The assets configuration provided lists directories containing image files of different formats (jpg, png, svg) that are included as assets in the Flutter project. This allows the project to access these image files programmatically through their asset paths.

## Credits

- Built with flutter❤️ by [vishal kathiriya]