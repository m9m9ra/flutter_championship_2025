# [Worldskills 2025](https://pro.firpo.ru/)  mobile development app 

<p>Разработка велась с использованием последней стабильной версии Flutter на момент проекта.
<br/>
Этот проект представляет собой шаблон чемпионатного приложения, использующий метод управления состоянием Mobx в Flutter. Он включает операции CRUD (Создание, Чтение, Обновление, Удаление) для пользователей и аутентификацию, что делает его реалистичным примером для реальных сценариев. Чтобы продемонстрировать, что нативные приложения можно создавать с помощью Flutter, в пользовательском интерфейсе проекта использовались компоненты, максимально приближенные к нативным, вместо стандартных компонентов Flutter.
<br/>
Разработка велась с использованием последней стабильной версии Flutter на момент проекта..</p>

![Worldskills 2025](https://github.com/m9m9ra/flutter_championship_2025/blob/main/publication/preview.png)

## Getting Started

```
flutter pub get
```


```
flutter pub run build_ranner build
```

```
chose ios / android
```

### API Integration
<p>A Rest API is used for user operations, and the API code is not included in this repository. You can develop API endpoints according to the UserModel class in the project to make it suitable for use. You need to update the BASE_URL value in the '.env' file content to match your API structure. You can find the naming used for CRUD and authentication endpoints in the UserService class, and you may need to revise it according to your API structure.</p>

#
### Supabase Integration
<p>The project uses Storage for uploading images and accessing them via URL, Extensions and Firestore Database for email infrastructure and Functions for triggering email sending. Therefore, you will need a supabase project.</p>

<!-- #
### Firebase Trigger Email Extension Integration
<p>For email verification, a verification code is sent to the email address provided by the user. The Firebase Trigger Email extension is used for email infrastructure. You need to activate this extension via the Firebase console. Besides verification code sending, the email infrastructure is used for different scenarios as well. Email sending is triggered by Firebase Cloud Functions.</p> -->

<!-- #
### Firebase Cloud Functions Integration
<p>The project already includes the functions folder and firebase.json file to be added with Cloud Functions. If you specify that the functions/index.js file should be overwritten while integrating cloud functions, you will delete the cloud functions that you need to deploy for the email infrastructure from the file. You can skip the overwrite step with the "No" option, or if it is overwritten, you can copy and deploy the functions again from the relevant file in this Github repo.</p> -->

## Screenshoots
###### Hover the mouse cursor over the images for explanations.
<!-- <img src="https://github.com/m9m9ra/ws-redi-mobile/blob/main/assets/Home.png" title="Login Screen" height="500">
<img src="https://github.com/m9m9ra/ws-redi-mobile/blob/main/assets/Onboarding%201.png" title="Forgot Password Screen" height="500">
<img src="https://github.com/m9m9ra/ws-redi-mobile/blob/main/assets/Splash.png" title="Register Screen" height="500"> -->


<!-- <img src="https://github.com/enescerrahoglu/template_app_bloc/assets/76053138/4af3da17-a98c-409b-a5d2-ab70384948c6" title="Verificaton Code Screen" height="500">
<img src="https://github.com/enescerrahoglu/template_app_bloc/assets/76053138/78905109-f0b5-489c-a07d-77a46c16a7a9" title="Verification code and welcome emails" height="500"> -->
<!-- <img src="https://github.com/enescerrahoglu/template_app_bloc/assets/76053138/c290e25a-38af-405f-a2a8-cea9cd27d8b5" title="Update Profile Screen" height="500">
<img src="https://github.com/enescerrahoglu/template_app_bloc/assets/76053138/681425e4-9848-4892-9b4a-eeac1a9f1b44" title="View/Edit Profile Photo Screen" height="500">
<img src="https://github.com/enescerrahoglu/template_app_bloc/assets/76053138/74a98cd5-9317-4889-b168-6d4be3086ce6" title="Home Screen" height="500">
<img src="https://github.com/enescerrahoglu/template_app_bloc/assets/76053138/4f0c7aed-be1e-4239-9893-6b8632367544" title="Settings Screen" height="500">
<img src="https://github.com/enescerrahoglu/template_app_bloc/assets/76053138/dd0145be-f13c-4043-a096-5d63132750a9" title="Change app theme" height="500">
<img src="https://github.com/enescerrahoglu/template_app_bloc/assets/76053138/40b2e5e8-84c4-424f-a94f-67bc9ad8d599" title="Change app language" height="500"> -->

<!-- ## Problems you may encounter
<p>To prevent [...lowerCamelCase identifier] problems caused by the easy_localization package, it will be sufficient to add the [constant_identifier_names: false] definition under the [rules:] statement in the analysis_options.yaml file in the project directory.</p>

![problem_1](https://github.com/enescerrahoglu/template_app_bloc/assets/76053138/d1ca7d89-4067-432d-8c01-7c0a3b72f232) -->

## Things to know
<p>After adding new string definitions to the [language-code].json (such as en.json, tr.json) file, run the following codes in the terminal one by one so that the easy_localization structure can recognize these changes:</p>

<!-- ```
dart run easy_localization:generate --source-dir assets/translations
``` -->

## Documentation

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
