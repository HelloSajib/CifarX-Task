### Project Overview
This Flutter app fetches a list of products from the DummyJSON API and displays them in a paginated list with infinite scrolling. It handles loading, success, and error states using BLoC, redirects to a mock login page on 403 errors, and uses GoRouter for navigation. The app is structured using DDD principles with a feature-first Clean Architecture approach, leveraging Dio for API calls and DartZ for functional error handling.

### API Used
- **API**: [DummyJSON](https://dummyjson.com)
- **Endpoints**:
  - **Pagination**: `https://dummyjson.com/products?limit=10&skip={skip}`
    - **Description**: Fetches a paginated list of products with a limit of 10 items per page. The `skip` parameter is used to fetch subsequent pages.
  - **Search**: `https://dummyjson.com/products/search?q={query}`
    - **Description**: Searches for products based on a user-provided query string, returning matching products.

### Features
- **Pagination**: Fetches 10 items per page with infinite scrolling triggered when the user reaches the bottom of the list.
- **State Management**: Uses BLoC pattern for managing loading, success, and error states.
- **Error Handling**:
  - Redirects to a mock login page on 403 (Unauthorized) errors.
  - Displays user-friendly error messages for other errors (e.g., 404, 500) with a retry option.
- **Navigation**: Implements GoRouter for centralized and clean route management.
- **UI**: Simple, clean, and reusable UI components (e.g., product cards, loading indicators, error widgets).

## Architecture and State Management
- **Architecture**: Follows Domain-Driven Design (DDD) with a feature-first Clean Architecture structure, separating concerns into `domain`, `data`, and `presentation` layers.
- **State Management**: Uses BLoC for reactive state management, with events and states defined for handling API data and pagination.
- **Error Handling**: Leverages `DartZ`'s `Either` type for functional error handling in the data layer, ensuring robust and type-safe error management.


### 🧪 Development Environment

This SDK was built and tested with the following environment:

```
[√] Flutter (Channel stable, 3.32.5, on Microsoft Windows [Version 10.0.22000.2538], locale en-US) [708ms]
    • Flutter version 3.32.5 on channel stable at C:\src\flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision fcf2c11572 (4 months ago), 2025-06-24 11:44:07 -0700
    • Engine revision dd93de6fb1
    • Dart version 3.8.1
    • DevTools version 2.45.1
```

> ✅ **Note**: It is recommended to use the same or newer version of Flutter and Dart to avoid compatibility issues.
