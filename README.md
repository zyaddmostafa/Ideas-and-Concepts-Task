# Flutter User Profile App

This Flutter app demonstrates a clean architecture implementation of a user profile section, including:

- **Profile Screen:** Displays the user's name, email, and profile picture, with buttons for editing the profile and viewing orders.
- **Edit Profile Screen:** Allows the user to update their name, email, phone, birthday, gender, and profile image. Changes are saved to Firebase Firestore, and profile images are uploaded to Supabase Storage (used instead of Firebase Storage due to billing requirements).
- **My Orders Screen:** Shows a list of previous orders ( static Data).

## Features

- Clean MVVM architecture
- GetX for state management, routing, and dependency injection
- Firebase Firestore for user and order data
- Supabase Storage for profile image uploads
- Reusable widgets for buttons, text fields, etc.
- Centralized constants for colors and text styles

## Why Supabase Storage?

Firebase Storage now requires a linked billing account for uploads. To keep the project simple and accessible, **Supabase Storage** is used for profile image uploads. All other user data is still managed in Firebase Firestore.

## Folder Structure

```
lib/
  core/
    constants/         # App colors, assets, text styles, etc.
    utils/             # Utility classes (regex, text styles)
    widgets/           # Reusable UI widgets
  data/
    models/            # Data models (User, Order, etc.)
    service/           # Firebase and Supabase service classes
  modules/
    edit_profile/      # Edit profile feature (bindings, controller, repo, views, widgets)
    orders/            # Orders feature (bindings, controller, repo, screen, widgets)
    profile/           # Profile feature (bindings, controller, repo, screens, widgets)
  routes/              # App routes and route names
  main.dart            # App entry point
```

## Getting Started

1. Clone the repo
2. Run `flutter pub get`
3. Set up your Firebase and Supabase credentials
4. Run the app on your device or emulator

## Notes

- Make sure to configure Firebase and Supabase in your project.
- Android/iOS permissions are required for image picking.
- The app is structured for easy extension and clean code maintenance.

## Screenshots

Below are screenshots of the main features of the app:

### Profile Screen

![image_alt](https://github.com/zyaddmostafa/Ideas-and-Concepts-Task/blob/main/profileScreen.png?raw=true)

### Edit Profile Screen

![image_alt](https://raw.githubusercontent.com/zyaddmostafa/Ideas-and-Concepts-Task/refs/heads/main/editProfileScreen.png)

### My Orders Screen

![image_alt](https://raw.githubusercontent.com/zyaddmostafa/Ideas-and-Concepts-Task/refs/heads/main/My_Order_Screen.png)

---

**Enjoy exploring the Flutter User Profile Feature!**
