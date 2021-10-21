# Swift For Jenkins

This repository includes bash script. It can run tests for Xcode Project. Import to Jenkins local server and set configurations. Run.

## Script


```bash
xcodebuild \
  -project Jenkins.xcodeproj \
  -scheme JenkinsTests \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 12,OS=15.0' \
  test
```

## Description
This app sends some http requests and make it with T type responses and completion.
