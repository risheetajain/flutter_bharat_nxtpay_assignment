A Flutter app that fetches and displays a list of articles from a public
API as json placeholders.
## Features
- List of articles
- Search functionality by Title and body
- Detail view
- Responsive UI
- Favorite Tab
## Setup Instructions
1. Clone the repo:
git clone (https://github.com/risheetajain/flutter_bharat_nxtpay_assignment/)
cd flutter_assignment
2. Install dependencies:
flutter pub get
3. Run the app:
flutter run
## Tech Stack
- Flutter SDK: 3.24.7
- State Management: Riverpod
- HTTP Client: dio
- Local Storage: Hive

## State Management Explanation
Why to choose state management
1. IT is very important to choose the state management because if we want to use one variable multiple we can easily accessible that from that place and update that variable will refect in complete app 
2. It gives better performance UI/User experience
3. Prevents from multiple times build even for single change
4. It makes business logic different from UI
Riverpod selection from multiple different state management
1. I choose riverpod because its the only state management which not rely on BuildContext
2. There is different notifier in this which we can 


## Known Issues / Limitations
Improvable Things
UI can be improved more for better efficiency we can use async notifier for api calls
Error Can be improved more efficiently with left and right

## Screenshots (Optional)
[Add if applicable]