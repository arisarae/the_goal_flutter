# The GOAL

## Assignment 7
> Basic Elements of Flutter

### Explain what a widget tree is in Flutter and how parent-child relationships work between widgets.
In Flutter, the entire UI is built from a Widget Tree, which is the hierarchy of all the composed widgets. This parent-child relationship is the fundamental, a parent widget is responsible for the layout, position, and configuration of its children. For example, a `Center` widget (parent) tells its `Text` widget (child) to align in the middle of the available space.

### List all the widgets you used in this project and explain their functions.
- `MyApp` (Custom Widget): A `StatelessWidget` that acts as the root of the application. Its function is to build and return the `MaterialApp`. 
- `MaterialApp`: The main wrapper for the entire app. Its function is to provide core services like navigation, theming, and localization.
- `StatelessWidget`: The base class for `MyHomePage` and `ItemCard`. Its function is to describe a part of the UI that doesn't change based on internal state.
- `Scaffold`: The main framework for the screen. Its function is to provide the standard app layout structure, including the `AppBar` and `body`.
- `AppBar`: The bar at the top of the screen. Its function is to display content like the `Text` title.
- `Text`: Its function is to display a string of text, used for the title, the "Welcome" message, and the item names.
- `Column`: A layout widget. Its function is to arrange its children (like the `Text` and `GridView`) in a vertical list.
- `Padding`: A layout widget. Its function is to add empty space (padding) around its child widget.
- `Center`: A layout widget. Its function is to center its child widget within the available space.
- `GridView.count`: A core layout widget. Its function is to arrange its children in a 2D grid with a specific number of columns (in this case, 3).
- `ItemCard` (Custom Widget): A custom `StatelessWidget`. Its function is to define the specific UI for a single grid item.
- `Material`: Used inside `ItemCard`. Its function is to act as a "canvas" that can be styled with a `color` and `borderRadius` (rounded corners).
- `InkWell`: A detector widget. Its function is to make its child tappable (`onTap`) and provide a visual splash effect when pressed.
- `Icon`: A display widget. Its function is to show a specific icon (like `Icons.all_inbox`) from the icon library.
- `SnackBar`: Its function is to show a temporary pop-up message at the bottom of the screen.

### What is the function of the `MaterialApp` widget? Explain why this widget is often used as the root widget.
The `MaterialApp` widget is used as the root wrapper for the whole application. Its main job is to provide essential Material Design services like navigation (managing screens and routes), providing a global theme (which defines default colors, fonts, and button styles), and handling localization for different languages. Because it's at the root, any widget deeper in the tree can access these services by "looking up" using its context, like when calling `Theme.of(context)`.

### Explain the difference between `StatelessWidget` and `StatefulWidget`. When would you choose one over the other?
The main difference is how widgets handle state, which is any data that can change over time. A `StatelessWidget` is immutable, meaning its properties cannot change once it's built, which is perfect for static UI like an icon or a fixed text label. Meanwhile, `StatefulWidget` is designed to manage internal state. When the UI needs to update dynamically (like a counter, a checkbox, or a form field), a `StatefulWidget` is used. To trigger an update, one calls the `setState()` method, which tells Flutter to rebuild that part of the widget tree and display the new information.

### What is `BuildContext` and why is it important in Flutter? How is it used in the `build` method?
A `BuildContext` is an object that acts as an "address," telling a widget its exact location within the widget tree. It's not the widget itself, but a locator for its position. This context is crucial because it's how a widget interacts with its ancestors. For example, calling `Theme.of(context)` uses the context to "look up" the tree to find the nearest `Theme` widget and get its data. The `build` method automatically receives this `BuildContext` from the Flutter framework.

### Explain the concept of a “hot reload” in Flutter and how it differs from a “hot restart”
Hot Reload injects new code into the running app and just re-runs the `build` methods, which is extremely fast. Critically, it keeps the app's state, so a counter's value, for example, is preserved. This is perfect for making quick UI changes. Meanwhile, Hot Restart re-runs the app from the beginning, completely destroying and resetting the state. This is necessary when changes are made to state initialization (like in `initState`) or other logic that Hot Reload can't handle.

## Assignment 8
> Flutter Navigation, Layouts, Forms, and Input Elements

### Explain the difference between `Navigator.push()` and `Navigator.pushReplacement()` in Flutter. In what context of your application is each best used?

`Navigator.push()` adds a new route (screen) to the top of the navigation stack. The old screen still exists underneath it and user can press the "back" button to return to it. This is best used for later when tapping an item in a list revealing its detail page, and going back from the page return us to the list. Meanwhile, `Navigator.pushReplacement()` pushes a new route while simultaneously removes the current route from the stack. This means the user cannot go back to the previous screen after moving. This is best used when switching between tabs in the same hierarcy (home, product list, product form).

### How do you use hierarchy widget like `Scaffold`, `AppBar`, dan `Drawer` to build a consistent page structure in the your application?

`Scaffold` used as the main container for a screen, providing standard slots for other major widgets. By using `Scaffold` on every page, a consistent base is established. `AppBar` is placed in the `Scaffold`'s `appBar` slot, ensuring the title bar appears in the same place on every screen. Having a familiar location for the page title and any action buttons can improve user flow. Similarly, the `Drawer` is placed in the `Scaffold`'s `drawer` slot. This creates a standard slide-out navigation menu that can be accessed from any page that includes it, giving the user a consistent way to navigate the entire app.

### In the context of user interface design, what do you think is the advantages of using layout widget like `Padding`, `SingleChildScrollView`, and `ListView` when displaying form elements? Provide usage examples from your application.

- `Padding`: Wrapping form fields in `Padding` prevent it from touching the screen edges or each other. In my app, I use this to add space around the text fields so they are easier to read, neater, and more comfortable to use.

- `SingleChildScrollView`: It prevents content overflow. When a form is longer than the screen (especially on small devices or when the keyboard appears), `SingleChildScrollView` wraps the form and allows the user to scroll, ensuring all fields remain accessible. This is perfect for a "Create Product" form that have many fields to fill.

- `ListView`: This is better for longer and more dynamic forms, as it's more memory-efficient by only rendering the form elements that are currently visible on the screen. `ListView` is ideal for a long settings page or a complex form, which we don't need yet in this application. Instead, its function here is to organize the `Drawer` contents into a single vertical list. This automatically makes the menu items scrollable, ensuring that even if more items are added later, they will all be accessible.

### How do you set the color theme so that your Football Shop have a visual identity that is consistent with the shop brand.

To ensure the app has a consistent visual identity, a global color theme is set in the `MaterialApp` widget. This is done using the theme property and a `ThemeData` object. Inside `ThemeData`, the `colorScheme` is defined, for example, by using `ColorScheme.fromSwatch()` and specifying a `primarySwatch`. This primary color is then automatically used by other widgets, like the `AppBar`'s background color. By defining the brand's main colors in this single, central location, every widget in the app will use these same colors by default, ensuring a consistent brand identity across the entire application.

## Assignment 9
> Integration of Django Web Service with Flutter Application

### Explain why we need to create a Dart model when fetching/sending JSON data. What are the consequences of directly mapping `Map<String, dynamic>` without using a model (in terms of type validation, null safety, and maintainability)?

A Dart model (like an `Item` class) is essential for converting "shapeless" JSON data into a strong, predictable Dart object. TWithout this model, direct access like `map['price']` returns a `dynamic` value, sacrificing type safety and risking a Runtime Exception if the server sends an unexpected type (like a string instead of a number). Furthermore, it damages null safety because accessing a missing key returns `null`, requiring constant manual checks throughout the application. For maintainability, a model enforces the DRY (Don't Repeat Yourself) principle. If a JSON field name changes, the developer only needs to update the `fromJson` method in one file, rather than hunting down every instance of that key across the entire codebase. 

### What is the purpose of the `http` and `CookieRequest` packages in this assignment? Explain the difference between their roles.

The `http` package is the foundation for network communication, offering generic methods like `GET` and `POST` required to transfer data to any server. Meanwhile, the `CookieRequest` package is a specialist built to manage Django's session-based authentication. Its purpose is to automatically manage session cookies. When Django sends a `Set-Cookie` header during login, `CookieRequest` saves it. Then, for all future requests, it automatically attaches that cookie, keeping the user logged in. The main difference is that `http` just sends data, while `CookieRequest` wraps that process to automatically handle the "state" of being logged in.

### Explain why the `CookieRequest` instance needs to be shared across all components in the Flutter application.

The `CookieRequest` instance must be shared across all components because it holds the session cookie that proves a user is logged in. This instance is the exclusive storage location for the essential session cookie received from Django upon successful login. If different widgets were to create their own separate `CookieRequest` instances, those new instances would not possess the stored cookie, causing any request they send to be treated as unauthenticated by the Django server. Sharing the single instance ensures that every part of the application can successfully make authorized requests and maintain the logged-in status.

### Explain the connectivity configuration required for Flutter to communicate with Django. Why do we need to add `10.0.2.2` to `ALLOWED_HOSTS`, enable CORS and SameSite/cookie settings, and add internet access permission in Android? What would happen if these configurations were not set correctly?

Several configurations are required for the Flutter emulator and Django server to communicate. First, `10.0.2.2` must be in `ALLOWED_HOSTS` because the Android emulator uses this IP to access the host computer's `localhost`. Without it, Django returns a 400 Bad Request. Second, CORS (Cross-Origin Resource Sharing) must be enabled for web builds, or the browser will block requests due to origin mismatch. Third, SameSite cookie settings are crucial for cross-origin authentication, as strict settings would prevent the session cookie from being sent, leading to failed logins. Finally, Internet Permission must be added to the `AndroidManifest.xml` file as Android apps are sandboxed and cannot access the internet by default. Without it, the operating system will block all outgoing network activity.

### Describe the data transmission mechanism—from user input to being displayed in Flutter.

Data flows through a synchronized cycle between the client and server. The process begins with the user entering data into Flutter's input fields, which the application then serializes into a JSON string using `jsonEncode()`. This JSON payload is sent in the body of an authenticated POST request to a Django endpoint. Django deserializes the data, validates it, saves the new record to the database, and returns a success response. Upon receiving success, Flutter navigates the user and crucially triggers a new GET request to the product list endpoint. This final GET retrieves the updated data set (including the new product) from the server, which Flutter then deserializes and renders in the UI, completing the transmission and display loop.

### Explain the authentication mechanism for login, registration, and logout—from entering account data in Flutter to Django’s authentication process and displaying the menu in Flutter.

The authentication process relies on Django's server-side sessions. For Registration, Flutter sends a POST request with new user data, which Django uses to create a new `User` object. For Login, Flutter sends credentials to the login endpoint. Django verifies them, starts a session, and sends the session cookie via the `Set-Cookie` header. The `CookieRequest` instance in Flutter automatically saves this cookie and notifies the app that the user is logged in, causing the UI to rebuild and show the main menu. For Logout, Flutter sends a request to the logout endpoint. Django invalidates the session and sends instructions to expire the client's cookie, causing CookieRequest to update its status to "logged out" and return the user to the login screen.

### Explain how you implemented the checklist above step-by-step (not just following a tutorial).

First, work on the Django project that we have done back in Assignment 2 until Assignment 6:

1. Create a new app in the-goal django project by running the command below in the project directory

    ```
    python manage.py startapp authentication
    ```

2. Fill the new app `views.py` using the code below for its register, login, and logout logic

    ```
    from django.http import JsonResponse
    from django.views.decorators.csrf import csrf_exempt
    from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
    from django.contrib.auth.models import User
    import json

    # Create your views here.
    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login successful!"
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login failed, account is disabled."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login failed, please check your username or password."
            }, status=401)
        
    @csrf_exempt
    def register(request):
        if request.method == 'POST':
            data = json.loads(request.body)
            username = data['username']
            password1 = data['password1']
            password2 = data['password2']

            if password1 != password2:
                return JsonResponse({
                    "status": False,
                    "message": "Passwords do not match."
                }, status=400)
            
            if User.objects.filter(username=username).exists():
                return JsonResponse({
                    "status": False,
                    "message": "Username already exists."
                }, status=400)
            
            user = User.objects.create_user(username=username, password=password1)
            user.save()
            
            return JsonResponse({
                "username": user.username,
                "status": 'success',
                "message": "User created successfully!"
            }, status=200)
        
        else:
            return JsonResponse({
                "status": False,
                "message": "Invalid request method."
            }, status=400)
        
    @csrf_exempt
    def logout(request):
        username = request.user.username
        try:
            auth_logout(request)
            return JsonResponse({
                "username": username,
                "status": True,
                "message": "Logged out successfully!"
            }, status=200)
        except:
            return JsonResponse({
                "status": False,
                "message": "Logout failed."
            }, status=401)
    ```

3. Add the following code to the current app `urls.py`
    ```
    from django.urls import path
    from authentication.views import *

    app_name = 'authentication'

    urlpatterns = [
        path('login/', login, name='login'),
        path('register/', register, name='register'),
        path('logout/', logout, name='logout')
    ]
    ```

4. Still in the same django project, move to the main app and add the following code to the existing code

    ```
    import json
    import requests

    def proxy_image(request):
        image_url = request.GET.get('url')
        if not image_url:
            return HttpResponse('No URL provided', status=400)
        
        try:
            response = requests.get(image_url, timeout=10)
            response.raise_for_status()
            
            return HttpResponse(
                response.content,
                content_type=response.headers.get('Content-Type', 'image/jpeg')
            )
        except requests.RequestException as e:
            return HttpResponse(f'Error fetching image: {str(e)}', status=500)
        
    @csrf_exempt
    def create_product_flutter(request):
        if request.method == 'POST':
            data = json.loads(request.body)
            name = strip_tags(data.get("name", ""))
            price = data.get("price", 0)
            description = strip_tags(data.get("description", ""))
            thumbnail = data.get("thumbnail", "")
            category = data.get("category", "equipment")
            stock = data.get("stock", 0)
            is_featured = data.get("is_featured", False)
            user = request.user
            
            new_product = Product(
                name=name,
                price=price,
                description=description,
                thumbnail=thumbnail,
                category=category,
                stock=stock,
                is_featured=is_featured,
                user=user
            )
            new_product.save()
            
            return JsonResponse({"status": "success"}, status=200)
        else:
            return JsonResponse({"status": "error"}, status=401)
    ```

5. Don't forget to also modify the `urls.py` in the main app for the new views that we just made

    ```
    # Add under current existing paths, inside the urlpatterns
    path('proxy-image/', proxy_image, name='proxy_image'),
    path('create-flutter/', create_product_flutter, name='create_product_flutter'),
    ```

6. Add `django-cors-headers` to the requirements.txt and reinstall all requirements using the following command in the project directory terminal (incase some library is missing)

    ```
    env\Scripts\activate
    pip install -r requirements.txt
    ```

7. Move to the `the_goal` directory, add the following urlpattern to its `urls.py`

    ```
    path('auth/', include('authentication.urls')),
    ```

8. Open `settings.py` then add `"10.0.2.2"` as an additional `ALLOWED_HOSTS` 

9. Add the following to `INSTALLED_APPS`

    ```
    'authentication',
    'corsheaders'
    ```

10. Add `'corsheaders.middleware.CorsMiddleware'` as a new `MIDDLEWARE`

11. Add these code at the very end of the `settings.py` file

    ```
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ```

12. Run the code and make sure everything works perfectly before doing `git add`, `git commit`, `git push`, and move to the flutter project


For the flutter project, follow these steps:
1. Install the following package by running it in the root directory terminal

    ```
    flutter pub add provider
    flutter pub add pbp_django_auth
    flutter pub add http
    ```

2. Modify the `main.dart` with the following code
    ```
    import 'package:flutter/material.dart';
    import 'package:the_goal_mobile/screens/login.dart';
    // import 'package:the_goal_mobile/screens/menu.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return Provider(
        create: (_) {
            CookieRequest request = CookieRequest();
            return request;
        },
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.green,
            ).copyWith(secondary: Colors.lightGreen),
            ),
            home: const LoginPage(),
        ),
        );
    }
    }
    ```

3. Modify `menu.dart` with the following code

    ```
    import 'package:flutter/material.dart';
    import 'package:the_goal_mobile/screens/login.dart';
    import 'package:the_goal_mobile/screens/product_entry_list.dart';
    import 'package:the_goal_mobile/screens/productlist_form.dart';
    import 'package:the_goal_mobile/widgets/left_drawer.dart';
    import 'package:the_goal_mobile/widgets/product_card.dart';

    class MyHomePage extends StatelessWidget {
    MyHomePage({super.key});

    final List<ItemHomepage> items = [
        ItemHomepage("All Product", Icons.all_inbox, Colors.blue, ProductEntryListPage()),
        //ItemHomepage("My Product", Icons.my_library_books, Colors.green, null),
        ItemHomepage("Create Product", Icons.add, Colors.green, const ProductFormPage()),
        ItemHomepage("Logout", Icons.logout, Colors.red, const LoginPage()),
    ];

    @override
    Widget build(BuildContext context) {
        final double screenWidth = MediaQuery.of(context).size.width;
        final double horizontalPadding = screenWidth < 600 ? 16.0 : 100.0;

        return Scaffold(
        appBar: AppBar(
            title: const Text(
            'The GOAL',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        drawer: LeftDrawer(),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Center(
                child: Column(
                    children: [
                    Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                        'Welcome to The GOAL',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth < 600 ? 24.0 : 30.0,
                        ),
                        ),
                    ),
                    SizedBox(height: screenWidth < 600 ? 14 : 20),

                    GridView.count(
                        primary: false,
                        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20.0),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: screenWidth < 600 ? 1 : 3,
                        shrinkWrap: true,
                        childAspectRatio: screenWidth < 600 ? 2.5 : 1,
                        children: items.map((ItemHomepage item) {
                        return ItemCard(item);
                        }).toList(),
                    ),
                    ],
                ),
                ),
            ],
            ),
        ),
        );
    }
    }

    class ItemHomepage {
    final String name;
    final IconData icon;
    final Color color;
    final Widget? link;

    ItemHomepage(this.name, this.icon, this.color, this.link);
    }
    ```

4. Modify the `left_drawer.dart` 

    ```
    import 'package:flutter/material.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';
    import 'package:the_goal_mobile/screens/login.dart';
    import 'package:the_goal_mobile/screens/menu.dart';
    import 'package:the_goal_mobile/screens/product_entry_list.dart';
    import 'package:the_goal_mobile/screens/productlist_form.dart';

    class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Drawer(
        child: ListView(
            children: [
            const DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: Column(
                children: [
                    Text(
                    'The GOAL',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Text(
                    "Buy our product and become The Greatest of All League!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                    ),
                    ),
                ],
                ),
            ),
            ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Home'),
                onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                );
                },
            ),
            ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Add Product'),
                onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProductFormPage()),
                );
                },
            ),
            ListTile(
                leading: const Icon(Icons.all_inbox),
                title: const Text('Product List'),
                onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProductEntryListPage()),
                );
                },
            ),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () async {
                // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
                // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                // If you using chrome,  use URL http://localhost:8000

                final response = await request.logout(
                    "http://127.0.0.1:8000/auth/logout/",
                );
                String message = response["message"];
                if (context.mounted) {
                    if (response['status']) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("$message See you again, $uname.")),
                    );
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                    } else {
                    ScaffoldMessenger.of(
                        context,
                    ).showSnackBar(SnackBar(content: Text(message)));
                    }
                }
                },
            ),
            ],
        ),
        );
    }
    }
    ```

5. Create a new screen `login.dart` and add the following code

    ```
    import 'package:the_goal_mobile/screens/menu.dart';
    import 'package:flutter/material.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';
    import 'package:the_goal_mobile/screens/register.dart';

    void main() {
    runApp(const LoginApp());
    }

    class LoginApp extends StatelessWidget {
    const LoginApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
            ).copyWith(secondary: Colors.blueAccent[400]),
        ),
        home: const LoginPage(),
        );
    }
    }

    class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    State<LoginPage> createState() => _LoginPageState();
    }

    class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();

        return Scaffold(
        body: Center(
            child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 200.0),
            child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    const Text(
                        'Login',
                        style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        ),
                    ),
                    const SizedBox(height: 30.0),
                    TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter your username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0,
                        ),
                        ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0,
                        ),
                        ),
                        obscureText: true,
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                        onPressed: () async {
                        String username = _usernameController.text;
                        String password = _passwordController.text;

                        // Check credentials
                        // TODO: Change the URL and don't forget to add trailing slash (/) at the end of URL!
                        // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                        // If you using chrome,  use URL http://localhost:8000
                        final response = await request.login(
                            "http://127.0.0.1:8000/auth/login/",
                            {'username': username, 'password': password},
                        );

                        if (request.loggedIn) {
                            String message = response['message'];
                            String uname = response['username'];
                            if (context.mounted) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                                ),
                            );
                            ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                SnackBar(
                                    content: Text("$message Welcome, $uname."),
                                ),
                                );
                            }
                        } else {
                            if (context.mounted) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                title: const Text('Login Failed'),
                                content: Text(response['message']),
                                actions: [
                                    TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                        Navigator.pop(context);
                                    },
                                    ),
                                ],
                                ),
                            );
                            }
                        }
                        },
                        style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        child: const Text('Login'),
                    ),
                    const SizedBox(height: 36.0),
                    GestureDetector(
                        onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                            ),
                        );
                        },
                        child: Text(
                        'Don\'t have an account? Register',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16.0,
                        ),
                        ),
                    ),
                    ],
                ),
                ),
            ),
            ),
        ),
        );
    }
    }
    ```

6. Create another new screen file `register.dart` and add these code

    ```
    import 'dart:convert';
    import 'package:flutter/material.dart';
    import 'package:the_goal_mobile/screens/login.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    class RegisterPage extends StatefulWidget {
    const RegisterPage({super.key});

    @override
    State<RegisterPage> createState() => _RegisterPageState();
    }

    class _RegisterPageState extends State<RegisterPage> {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
        appBar: AppBar(
            title: const Text('Register'),
            leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
                Navigator.pop(context);
            },
            ),
        ),
        body: Center(
            child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                    const Text(
                        'Register',
                        style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        ),
                    ),
                    const SizedBox(height: 30.0),
                    TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter your username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0,
                        ),
                        ),
                        validator: (value) {
                        if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                        }
                        return null;
                        },
                    ),
                    const SizedBox(height: 12.0),
                    TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0,
                        ),
                        ),
                        obscureText: true,
                        validator: (value) {
                        if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                        }
                        return null;
                        },
                    ),
                    const SizedBox(height: 12.0),
                    TextFormField(
                        controller: _confirmPasswordController,
                        decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Confirm your password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0,
                        ),
                        ),
                        obscureText: true,
                        validator: (value) {
                        if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                        }
                        return null;
                        },
                    ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                        onPressed: () async {
                        String username = _usernameController.text;
                        String password1 = _passwordController.text;
                        String password2 = _confirmPasswordController.text;

                        // Check credentials
                        // TODO: Change the URL and don't forget to add trailing slash (/) at the end of URL!
                        // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                        // If you using chrome,  use URL http://localhost:8000
                        final response = await request.postJson(
                            "http://127.0.0.1:8000/auth/register/",
                            jsonEncode({
                            "username": username,
                            "password1": password1,
                            "password2": password2,
                            }),
                        );
                        if (context.mounted) {
                            if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                content: Text('Successfully registered!'),
                                ),
                            );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                                ),
                            );
                            } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                content: Text('Failed to register!'),
                                ),
                            );
                            }
                        }
                        },
                        style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        child: const Text('Register'),
                    ),
                    ],
                ),
                ),
            ),
            ),
        ),
        );
    }
    }
    ```

7. Create a new folder named `model` in `lib` then create a `product_entry.dart` file with the following code

    ```
    import 'dart:convert';

    List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(
    json.decode(str).map((x) => ProductEntry.fromJson(x)),
    );

    String productEntryToJson(List<ProductEntry> data) =>
        json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    class ProductEntry {
    String id;
    String name;
    int price;
    String description;
    String thumbnail;
    String category;
    int stock;
    bool isFeatured;
    int? userId;

    ProductEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.thumbnail,
        required this.category,
        required this.stock,
        required this.isFeatured,
        required this.userId,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        category: json["category"],
        stock: json["stock"],
        isFeatured: json["is_featured"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "stock": stock,
        "is_featured": isFeatured,
        "user_id": userId,
    };
    }
    ```

8. Under the tag application in the `android/app/src/main/AndroidManifest.xml` file, add the following code
    ```
        <application>
        ...
        </application>
        <!-- Required to fetch data from the Internet. -->
        <uses-permission android:name="android.permission.INTERNET" />
    ```

9. Create a new widget file named `product_entry_card.dart`

    ```
    import 'package:flutter/material.dart';
    import 'package:the_goal_mobile/models/product_entry.dart';

    class ProductEntryCard extends StatelessWidget {
    final ProductEntry product;
    final VoidCallback onTap;

    const ProductEntryCard({
        super.key,
        required this.product,
        required this.onTap,
    });

    @override
    Widget build(BuildContext context) {
        return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.grey.shade300),
        ),
        elevation: 2,
        child: InkWell(
            onTap: onTap,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Expanded(
                child: Stack(
                    fit: StackFit.expand,
                    children: [
                    Image.network(
                        'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[300],
                        child: const Center(child: Icon(Icons.broken_image)),
                        ),
                    ),
                    
                    // Featured Badge
                    if (product.isFeatured)
                        Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                            ),
                            decoration: BoxDecoration(
                            color: Colors.yellow[700],
                            borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                            'Featured',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                            ),
                            ),
                        ),
                        ),
                    ],
                ),
                ),

                Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    // Title
                    Text(
                        product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        ),
                    ),
                    const SizedBox(height: 4),
                    
                    // Category
                    Text(
                        product.category,
                        style: TextStyle(
                        color: Colors.grey[600], 
                        fontSize: 14
                        ),
                    ),
                    const SizedBox(height: 6),
                    
                    // Price
                    Text(
                        'Only at Rp ${product.price}',
                        style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        ),
                    ),
                    ],
                ),
                ),
            ],
            ),
        ),
        );
    }
    }
    ```

10. Create a new screen for product list named `product_entry_list.dart`

    ```
    import 'package:flutter/material.dart';
    import 'package:the_goal_mobile/models/product_entry.dart';
    import 'package:the_goal_mobile/widgets/left_drawer.dart';
    import 'package:the_goal_mobile/screens/product_detail.dart';
    import 'package:the_goal_mobile/widgets/product_entry_card.dart';
    import 'package:provider/provider.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';

    class ProductEntryListPage extends StatefulWidget {
    const ProductEntryListPage({super.key});

    @override
    State<ProductEntryListPage> createState() => _ProductEntryListPageState();
    }

    class _ProductEntryListPageState extends State<ProductEntryListPage> {
    bool showMyProducts = false;
    Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
        // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
        // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
        // If you using chrome,  use URL http://localhost:8000

        final response = await request.get('http://127.0.0.1:8000/json/');

        var data = response;

        List<ProductEntry> listProduct = [];
        for (var d in data) {
        if (d != null) {
            listProduct.add(ProductEntry.fromJson(d));
        }
        }
        return listProduct;
    }

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        final double width = MediaQuery.of(context).size.width;

        return Scaffold(
        appBar: AppBar(
            title: const Center(child: Text('Product Entry List')),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(request),
            builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
            } else {
                if (!snapshot.hasData) {
                return const Column(
                    children: [
                    Text(
                        'There are no product in The GOAL yet.',
                        style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                    ),
                    SizedBox(height: 8),
                    ],
                );
                } else {
                return GridView.builder(
                    padding: EdgeInsets.symmetric(
                    horizontal: width > 800 ? 100 : 18,
                    vertical: 16,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: width > 800 ? 2 : 1,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: width > 800 ? 2 : 1.5, 
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => ProductEntryCard(
                    product: snapshot.data![index],
                    onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailPage(product: snapshot.data![index]),
                        ),
                        );
                    },
                    ),
                );
                }
            }
            },
        ),
        );
    }
    }
    ```

11. Add another screen file named `product_detail.dart`

    ```
    import 'package:flutter/material.dart';
    import 'package:the_goal_mobile/models/product_entry.dart';

    class ProductDetailPage extends StatelessWidget {
    final ProductEntry product;

    const ProductDetailPage({super.key, required this.product});

    Widget _buildProductDetails(ProductEntry product) {
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            // Badge
            Row(
            children: [
                Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 4.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                    product.category,
                    style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    ),
                ),
                ),

                const SizedBox(width: 10),

                if (product.isFeatured)
                Container(
                    padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                    'featured',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                    ),
                    ),
                ),
            ],
            ),
            const SizedBox(height: 16),

            // Title
            Text(
            product.name,
            style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
            ),
            ),

            const SizedBox(height: 8),

            // Price
            Text(
            'Rp ${product.price}',
            style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
            ),
            ),

            const SizedBox(height: 8),

            // Stock
            Text(
            'Stock: ${product.stock}',
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),

            const Divider(height: 16),

            // Description
            Text(
            product.description,
            style: const TextStyle(
                fontSize: 16.0,
                height: 1.6,
                color: Colors.black87,
            ),
            textAlign: TextAlign.left,
            ),
            const SizedBox(height: 24),
        ],
        );
    }

    Widget _buildProductImage(
        BuildContext context,
        ProductEntry product,
        double screenWidth,
    ) {
        final bool isLargeScreen = screenWidth > 800;
        final bool isUrlInvalid = product.thumbnail == "" || product.thumbnail.isEmpty;

        Widget placeholderWidget = Container(
        width: isLargeScreen ? 350 : double.infinity,
        height: isLargeScreen ? 350 : 250,
        color: Colors.grey[300],
        child: const Center(child: Icon(Icons.broken_image, size: 50)),
        );

        return Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: isUrlInvalid
                ? placeholderWidget
                : Image.network(
                    'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                    width: isLargeScreen ? 350 : double.infinity,
                    height: isLargeScreen ? 350 : 250,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                    width: isLargeScreen ? 350 : double.infinity,
                    height: isLargeScreen ? 350 : 250,
                    color: Colors.grey[300],
                    child: const Center(
                        child: Icon(Icons.broken_image, size: 50),
                    ),
                    ),
                ),
        ),
        );
    }

    @override
    Widget build(BuildContext context) {
        final double screenWidth = MediaQuery.of(context).size.width;
        final bool isLargeScreen = screenWidth > 800;
        final double maxWidth = screenWidth > 900 ? 900 : screenWidth;

        final imageWidget = _buildProductImage(context, product, screenWidth);

        final detailsWidget = _buildProductDetails(product);

        return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Center(
            child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Card(
                    margin: EdgeInsets.symmetric(
                        horizontal: isLargeScreen ? 0 : 16.0,
                    ),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(
                        isLargeScreen ? 40.0 : 24.0,
                        ),
                        child: isLargeScreen
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Flexible(flex: 4, child: imageWidget),
                                const SizedBox(
                                    width: 40,
                                ),
                                Flexible(flex: 6, child: detailsWidget),
                                ],
                            )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                imageWidget,
                                const SizedBox(height: 24),
                                detailsWidget,
                                ],
                            ),
                    ),
                    ),
                    const SizedBox(height: 24),
                ],
                ),
            ),
            ),
        ),
        );
    }
    }
    ```

12. Adjust the form file `productlist_form.dart` with the following code

    ```
    import 'dart:convert';
    import 'package:provider/provider.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:flutter/material.dart';
    import 'package:flutter/services.dart';
    import 'package:the_goal_mobile/screens/menu.dart';
    import 'package:the_goal_mobile/widgets/left_drawer.dart';

    class ProductFormPage extends StatefulWidget {
    const ProductFormPage({super.key});

    @override
    State<ProductFormPage> createState() => _ProductFormPageState();
    }

    class _ProductFormPageState extends State<ProductFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int? _price;
    String _desc = "";
    String _thumbnail = "";
    String _category = "Shoes";
    int? _stock;
    bool _isFeatured = false;

    final List<String> _categories = [
        'Shoes',
        'Clothing',
        'Equipment',
    ];

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
        appBar: AppBar(
            title: const Center(child: Text('Add Product Form')),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                // === Name ===
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Product Name",
                        labelText: "Product Name",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                        _name = value ?? "";
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Product name cannot be empty!";
                        }
                        
                        if (value.length > 255) {
                        return "Product name cannot be longer than 255 character!";
                        }
                        return null;
                    },
                    ),
                ), 

                // === Price ===
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Product Price",
                        labelText: "Product Price",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [ FilteringTextInputFormatter.digitsOnly ],
                    onChanged: (String? value) {
                        setState(() {
                        _price = int.tryParse(value ?? "");
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Product price cannot be empty!";
                        }

                        final int? num = int.tryParse(value);
                        if (num == null) {
                        return "Please enter a valid number!";
                        }

                        if (num < 0) {
                        return "Product price cannot be negative!";
                        }
                        return null;
                    },
                    ),
                ),

                // === Description ===
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "Product Description",
                        labelText: "Product Description",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                        _desc = value ?? "";
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Product description cannot be empty!";
                        }
                        return null;
                    },
                    ),
                ),

                // === Thumbnail URL ===
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Thumbnail URL (optional)",
                        labelText: "Thumbnail URL",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                        _thumbnail = value ?? "";
                        });
                    },
                    ),
                ),

                // === Category ===
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        labelText: "Category",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    value: _category,
                    items: _categories
                        .map(
                            (cat) => DropdownMenuItem(
                            value: cat,
                            child: Text(cat[0].toUpperCase() + cat.substring(1)),
                            ),
                        )
                        .toList(),
                    onChanged: (String? newValue) {
                        setState(() {
                        if (newValue != null) {
                            _category = newValue;
                        }
                        });
                    },
                    ),
                ),

                // === Stock ===
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Product Stock",
                        labelText: "Product Stock",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (String? value) {
                        setState(() {
                        _stock = int.tryParse(value ?? "");
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Product stock cannot be empty!";
                        }
                        final int? num = int.tryParse(value);
                        if (num == null) {
                        return "Please enter a valid number!";
                        }
                        if (num < 0) {
                        return "Product stock cannot be negative!";
                        }
                        return null;
                    },
                    ),
                ),
                
                // === Is Featured ===
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SwitchListTile(
                    title: const Text("Mark as Featured Product"),
                    value: _isFeatured,
                    onChanged: (bool value) {
                        setState(() {
                        _isFeatured = value;
                        });
                    },
                    ),
                ),

                // === Save Button ===
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.green),
                        ),
                        onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                            final response = await request.postJson(
                            "http://127.0.0.1:8000/create-flutter/",
                            jsonEncode({
                                "name": _name,
                                "price": _price,
                                "description": _desc,
                                "thumbnail": _thumbnail,
                                "category": _category,
                                "stock": _stock,
                                "is_featured": _isFeatured,
                            }),
                            );

                            if (context.mounted) {
                            if (response['status'] == 'success') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Product successfully saved!"),
                                ),
                                );
                                Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                ),
                                );
                            } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                    "Something went wrong, please try again.",
                                    ),
                                ),
                                );
                            }
                            }
                        }
                        },
                        child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                        ),
                    ),
                    ),
                ),
                ],
            ),
            ),
        ),
        );
    }
    }
    ```

13. Update the `product_card.dart` using the following code

    ```
    import 'package:flutter/material.dart';
    import 'package:the_goal_mobile/screens/menu.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    class ItemCard extends StatelessWidget {
    final ItemHomepage item;

    const ItemCard(this.item, {super.key});

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Material(
        color: item.color,
        borderRadius: BorderRadius.circular(12),

        child: InkWell(
            onTap: () async {
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                SnackBar(content: Text("You pressed the ${item.name} button!")),
                );

            if (item.link == null) {
                return;
            }

            if (item.name == "Logout") {
                // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
                // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                // If you using chrome,  use URL http://localhost:8000

                final response = await request.logout(
                "http://127.0.0.1:8000/auth/logout/",
                );
                String message = response["message"];
                if (context.mounted) {
                if (response['status']) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("$message See you again, $uname.")),
                    );
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => item.link!),
                    );
                } else {
                    ScaffoldMessenger.of(
                    context,
                    ).showSnackBar(SnackBar(content: Text(message)));
                }
                }
            } else {
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => item.link!),
                );
            }
            },

            child: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(item.icon, color: Colors.white, size: 30.0),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    ),
                ],
                ),
            ),
            ),
        ),
        );
    }
    }
    ```

14. Run the application using `flutter run -d chrome` and make sure the app run smoothly. Resolve any bugs if there's any, and adjust the design accordingly. 

15. Save the changes and run these lines in the root directory command prompt

    ```
    git add .
    git commit -m "feat: add user auth, product list and detail, and connect to django"
    git push origin master
    ```

16. Modify the `README.md` file, fill it with the information needed, and do another git add, commit, push