# get to konw firebase

## reference

- [Firebase for Flutter を理解する](https://firebase.google.com/codelabs/firebase-get-to-know-flutter?hl=ja#0)
  - [codelabs/firebase-get-to-know-flutter at main · flutter/codelabs](https://github.com/flutter/codelabs/tree/main/firebase-get-to-know-flutter)
  - [firebase/flutterfire: 🔥 A collection of Firebase plugins for Flutter apps.](https://github.com/firebase/flutterfire)

<p align=center>
  <img src="/gtk_flutter/images/ss.png" alt=ss width=350 />
</p>

## firebase setup on Windows

- [firebase/flutterfire: 🔥 A collection of Firebase plugins for Flutter apps.](https://github.com/firebase/flutterfire)

```shell
dart pub global activate flutterfire_cli
```

install through [coreybutler/nvm-windows: A node.js version management utility for Windows. Ironically written in Go.](https://github.com/coreybutler/nvm-windows?tab=readme-ov-file)

```shell
# run codes in administrator mode in powershell
nvm install lts
nmv use blah blah

npm install -g firebase-tools
firebase login

flutterfire configure
```
