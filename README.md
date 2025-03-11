# Clarity Microsoft

![Flutter](https://img.shields.io/badge/Flutter-Plugin-blue)

**Clarity Microsoft** es un plugin de Flutter que permite integrar fácilmente [Microsoft Clarity](https://clarity.microsoft.com/) en cualquier aplicación Flutter, permitiendo analizar el comportamiento de los usuarios mediante grabaciones de sesiones y mapas de calor.

## 📦 Instalación

Agrega la dependencia en tu archivo `pubspec.yaml`:

```yaml
dependencies:
  clarity_microsoft: latest_version
```

Luego, ejecuta:

```sh
flutter pub get
```

## 🔧 Configuración

### **iOS**
1. Abre el archivo `ios/Podfile` y asegúrate de que la plataforma mínima sea **iOS 11.0** o superior:
   ```ruby
   platform :ios, '11.0'
   ```
2. Abre `ios/Runner/Info.plist` y agrega lo siguiente:
   ```xml
   <key>NSAppTransportSecurity</key>
   <dict>
       <key>NSAllowsArbitraryLoads</key>
       <true/>
   </dict>
   ```

### **Android**
1. Abre `android/app/build.gradle` y configura la versión mínima de SDK en `minSdkVersion 21`:
   ```gradle
   android {
       defaultConfig {
           minSdkVersion 21
       }
   }
   ```
2. Asegúrate de agregar permisos de Internet en `AndroidManifest.xml`:
   ```xml
   <uses-permission android:name="android.permission.INTERNET"/>
   ```

## 🚀 Uso

### **Inicializar Clarity**
Para inicializar Microsoft Clarity en tu aplicación, usa el siguiente código:

```dart
import 'package:clarity_microsoft/clarity_microsoft.dart';

void main() async {
  final clarity = ClarityMicrosoft();
  await clarity.initClarity("TU_PROJECT_ID", "USER_ID_OPCIONAL");
}
```

Si `USER_ID` no está disponible, puedes omitirlo:

```dart
await clarity.initClarity("TU_PROJECT_ID", "");
```

### **Obtener versión de la plataforma**
Puedes obtener la versión del sistema operativo donde se ejecuta la app:

```dart
String version = await clarity.getPlatformVersion() ?? "Desconocida";
print("Versión del sistema: $version");
```

## 🛠 Métodos disponibles

| Método                | Descripción |
|----------------------|-------------|
| `initClarity(projectId, userId)` | Inicializa Microsoft Clarity con el ID del proyecto y el usuario. |
| `getPlatformVersion()` | Retorna la versión del sistema operativo. |

## 📝 Notas
- Asegúrate de ingresar un `projectId` válido registrado en Microsoft Clarity.
- En iOS, recuerda habilitar **App Transport Security** si usas HTTP en lugar de HTTPS.
- En Android, asegúrate de que tu aplicación tenga permiso de acceso a Internet.

