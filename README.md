# Football Fixtures App

A Swift-based iOS application that displays football fixtures data from [football-data.org](https://www.football-data.org).

## App Preview

### Demo
<div align="leading">
  <img src="https://github.com/user-attachments/assets/ca91de94-92cf-4fe1-b58b-5179f446ee68" alt="gif" width="200">
</div>

### Screenshots
<div style="display: flex; justify-content: space-between;">
 <img src="https://github.com/user-attachments/assets/2092e663-c3bf-44c3-ad4b-44b0eb4adece" width="200" alt="Fixtures List">
 <img src="https://github.com/user-attachments/assets/d6e1280c-2dd7-4759-9586-70bd248def1e" width="200" alt="Error Handling">
 <img src="https://github.com/user-attachments/assets/977d53b4-c7cc-4cd8-8d7e-a6e229566d41" width="200" alt="Offline Mode">
 <img src="https://github.com/user-attachments/assets/f8bb3aec-a693-4986-b013-cfe67e6929cc" width="200" alt="Offline Mode">
</div>

## Features

- View upcoming and past football fixtures
- Local data persistence using Realm
- Offline support
- Error handling with user-friendly messages
- Protocol-oriented architecture
- Dependency injection for better testability

## Technical Stack

### Architecture & Design Patterns
- **MVVM (Model-View-ViewModel)** architecture
- Protocol-oriented programming
- Dependency injection
- Repository pattern for data management

### Technologies
- Swift
- UIKit
- NSLayoutConstraints for programmatic UI
- Realm for local data persistence
- URLSession for networking

### Testing
- XCTest framework
- Unit tests for ViewModels
- Mock objects for dependency injection
- Network response mocking

## Project Structure

```
FootballFixtures/
├── App/
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── Model/
│   └── [Data Models]
├── Network/
│   └── [Networking Layer]
├── Utils/
│   ├── CacheDB/
│   │   └── [Database Caching Implementation]
│   ├── RepoDIContainer/
│   │   └── [Dependency Injection Container]
│   └── [Other Utility Classes and Extensions]
├── View/
│   └── TabBar/
│       ├── FieldScene/
│       │   └── [Field-related Views]
│       └── FixtureScene/
│           └── [Fixture-related Views]
└── ViewModel/
    └── [View Models]
└── Tests/
    ├── ViewModels/
    │   └── FixturesViewModelTests.swift
    ├── Mocks/
    │   └── MockFixtureRepository.swift
    └── TestHelpers/
        └── XCTestCase+Extensions.swift
```

## Implementation Details

### MVVM Architecture
- Clear separation of concerns between View, ViewModel, and Model layers
- ViewModels expose data through observable properties
- Views observe and react to ViewModel state changes

### Dependency Injection
- All dependencies are injected through protocols
- Enables easy mocking for unit tests
- Improves code modularity and testability

### Protocol-Oriented Approach
- Interfaces defined through protocols
- Promotes loose coupling between components
- Facilitates mock object creation for testing

### Error Handling
- Comprehensive error handling throughout the app
- User-friendly error messages
- Network error recovery mechanisms
- Offline support through local data persistence

### Local Data Persistence
- Realm database integration
- Efficient data querying and updates
- Thread-safe database operations
- Automatic schema migrations

### UI Implementation
- Programmatic UI using NSLayoutConstraints
- No storyboards or XIB files
- Responsive layout that adapts to different screen sizes
- Clean and modular view code

## **Building and Running the Application**  

1. **Clone the repository:**  
   ```bash
   git clone https://github.com/yeniObabatunde/Football-Fixtures.git
      cd your-project-folder
   ```  

2. **Open the project in Xcode:**  
   ```bash
   open FootballFixtures.xcodeproj
   ```  

3. **Run the application:**  
   - Ensure you have **Xcode 14 or later** installed.  
   - Select a **simulator or physical device**, then press `Cmd + R`. 

## Testing

Run the tests using:
- Xcode's Test Navigator (⌘6)
- Or use the shortcut ⌘U to run all tests

## Requirements

- iOS 13.0+
- Xcode 13.0+
- Swift 5.0+

## Author

Omoyeni

## Acknowledgments

- [football-data.org](https://www.football-data.org) for providing the football fixtures API
