1LAVO Flutter WebView starter

This project opens https://www.1lavo.com/ inside a Flutter app.

UPLOAD FROM ANDROID:
1. Download and extract this ZIP.
2. In GitHub, create a repository named 1lavo-app.
3. Upload the files inside this folder to the repository root. Do not upload the ZIP as the only file.
4. Ensure pubspec.yaml and codemagic.yaml are at the root and main.dart is inside lib/.
5. In Codemagic, connect GitHub and select this repository.
6. Run android-build to create an APK.

iOS:
The iOS workflow only checks compilation and creates an unsigned app bundle. To distribute an iPhone app or submit it to the App Store, configure Apple signing and an Apple Developer account.

Before publishing, test booking, WhatsApp links, location prompts, external links and all website functionality inside the app. Store acceptance is not guaranteed for a basic website wrapper.
