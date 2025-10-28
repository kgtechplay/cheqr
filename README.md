# Cheqr - AI-Powered Fact-Checking Tool

A comprehensive fact-checking solution with a Python backend API and Flutter mobile application.

## 🚀 Features

- **Statement Decomposition**: Breaks down complex factual statements into atomic questions using GPT-4
- **Evidence Search**: Uses Tavily API to search for relevant information
- **Binary Verification**: Determines if statements are true or false based on evidence
- **Mobile App**: Cross-platform Flutter app for easy fact-checking on the go
- **REST API**: Python backend for web and mobile integration

## 📁 Project Structure

```
cheqr/
├── lib/                    # Flutter app source code
│   ├── main.dart          # App entry point
│   ├── screens/
│   │   └── home_screen.dart    # Main UI screen
│   ├── widgets/           # Reusable UI components
│   └── services/          # API and business logic
│
├── backend/               # Python backend
│   ├── main.py           # Flask/FastAPI server
│   ├── checker.py        # Core fact-checking logic
│   ├── break_statement.py    # Statement decomposition
│   ├── search_results.py     # Tavily integration
│   └── requirements.txt       # Python dependencies
│
├── pubspec.yaml          # Flutter project configuration
├── android/              # Android-specific build files
├── ios/                  # iOS-specific build files
├── web/                  # Web platform support
└── test/                 # Unit and widget tests
```

## 🛠️ Setup

### Python Backend

1. Install dependencies:
```bash
pip install -r requirements.txt
```

2. Create a `config.env` file with your API keys:
```
TAVILY_API_KEY=your_tavily_api_key
OPENAI_API_KEY=your_openai_api_key
```

3. Run the backend:
```bash
python main.py
```

### Flutter Mobile App

1. Install Flutter (if not already installed):
   - Follow instructions at [flutter.dev](https://flutter.dev/docs/get-started/install)

2. Install dependencies:
```bash
flutter pub get
```

3. Generate platform-specific files:
```bash
flutter create --platforms=android,ios,web .
```

4. Run the app:
```bash
flutter run
```

## 💻 Usage

### Python Backend

#### Basic Fact-Checking
```python
from checker import check_statement

result = check_statement("Your factual statement here")
print(result)  # True or False
```

#### Decompose Statements
```python
from break_statement import decompose_statement_to_questions

questions, count = decompose_statement_to_questions("Your statement")
for q in questions:
    print(q)
```

#### Search and Verify
```python
from search_results import yes_no

answer = yes_no("Is your question verifiable?")
print(answer)  # "Yes" or "No"
```

### Flutter App

1. Open the app
2. Enter a factual statement in the text field
3. Tap "Check Statement" to verify the claim
4. View the result

## 🧪 Testing

### Python Tests
```bash
pytest
```

### Flutter Tests
```bash
flutter test
```

## 📦 Dependencies

### Python
- `python-dotenv`
- `tavily-python`
- `openai`

### Flutter
- `flutter` (SDK)
- `http`
- `provider`
- `cupertino_icons`

## 🔧 Development

### Running Tests
```bash
# Python tests
python -m pytest

# Flutter tests
flutter test
```

### Building the Flutter App
```bash
# Android
flutter build apk

# iOS
flutter build ios

# Web
flutter build web
```

## 📝 License

MIT

## 👤 Author

kgtechplay
