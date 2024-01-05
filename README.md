# UrlLauncherClient

## Getting Started

### Installation

Add the following to your `pubspec.yaml` file:

```yaml

dependencies:
  url_launcher_client: ^0.0.1
    git:
      url: https://github.com/arcas0803/url_launcher_client.git
      ref: main

```

## Usage

### Import

```dart

import 'package:url_launcher_client/url_launcher_client.dart';

```

### Methods

#### Launch URL

```dart

final client = UrlLauncherClient();

await client.launchUrl(url: 'https://www.google.com');

```

#### Launch Email

```dart

final client = UrlLauncherClient();

await client.launchEmail(
    email:  'example@aa.aa',
    subject: 'Subject',
    body: 'Body',
);


```

#### Launch Phone

```dart

final client = UrlLauncherClient();

await client.launchPhone(phone: '123456789');

```

#### Launch SMS

```dart

final client = UrlLauncherClient();

await client.launchSms(phone: '123456789');

```

